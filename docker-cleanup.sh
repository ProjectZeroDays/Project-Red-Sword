#!/bin/sh

set -e

REPOSITORY=$1
AUTH_SERVER="https://auth.docker.io/token?service=registry.docker.io"
REGISTRY_SERVER="https://index.docker.io"

# Relevant API documentation:
# https://docs.docker.com/registry/spec/auth/
# https://docs.docker.com/registry/spec/#listing-image-tags
# https://docs.docker.com/registry/spec/#deleting-an-image

if [ -z "$DOCKER_HUB_USER" ] || [ -z "$DOCKER_HUB_ACCESS_TOKEN" ]; then
    echo "WARNING: Doing nothing as DOCKER_HUB_USER and/or DOCKER_HUB_ACCESS_TOKEN are not set"
    exit 0
fi

AUTH_TOKEN=$(curl -u $DOCKER_HUB_USER:$DOCKER_HUB_ACCESS_TOKEN -s "$AUTH_SERVER&scope=repository:$REPOSITORY:pull,delete" | jq -r '.token')
JSON_ANSWER=$(curl -s -H "Accept: application/json" -H "Authorization: Bearer $AUTH_TOKEN" "$REGISTRY_SERVER/v2/$REPOSITORY/tags/list")
echo "GET $REGISTRY_SERVER/v2/$REPOSITORY/tags/list returned: $JSON_ANSWER"

TAGS=$(echo $JSON_ANSWER | jq -r .tags[])


MONTH_RE="^($(date +%Y-%m)|$(date +%Y-%m -d "1 month ago")|$(date +%Y-%m -d "2 month ago"))"
for tag in $TAGS; do
    case $tag in
	[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9])
	    echo -n "Checking age of $tag ... "
	    if ! echo "$tag" | grep -qE "$MONTH_RE"; then
		echo "more than 3 months old, to be deleted."
		TO_DELETE="$tag $TO_DELETE"
	    else
		echo "less than 3 months old, to be kept."
	    fi
	    ;;
    esac
done

# Easy way to test, uncomment next line and put a tag that you want to delete
# TO_DELETE=2019-10-21

for tag in $TO_DELETE; do
    echo "Trying to delete $REPOSITORY:$tag..."

    JSON_ANSWER=$(curl -s -H "Accept: application/vnd.docker.distribution.manifest.v2+json" -H "Authorization: Bearer $AUTH_TOKEN" "$REGISTRY_SERVER/v2/$REPOSITORY/manifests/$tag")
    echo "Manifest: $JSON_ANSWER"
    DIGEST=$(echo $JSON_ANSWER | jq -r .config.digest)
    echo "Digest for $REPOSITORY:$tag is $DIGEST"

    JSON_ANSWER=$(curl -s -X DELETE -H "Accept: application/json" -H "Authorization: Bearer $AUTH_TOKEN" "$REGISTRY_SERVER/v2/$REPOSITORY/manifests/$DIGEST")
    echo "DELETE $REGISTRY_SERVER/v2/$REPOSITORY/manifests/$DIGEST returned: $JSON_ANSWER"
done
