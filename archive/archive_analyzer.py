import os
import sys
from archive.archive_parser import parse_sources

def analyze_sources():
    try:
        sources = parse_sources()
        # Perform analysis on sources
        print(sources)
    except Exception as e:
        print(f"Error during source analysis: {e}")
