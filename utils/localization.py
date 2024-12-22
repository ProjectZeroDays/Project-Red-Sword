
from gettext import translation

def set_language(lang_code):
    lang = translation('base', localedir='locales', languages=[lang_code])
    lang.install()
    _ = lang.gettext
    return _
