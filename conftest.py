import shutil
import tempfile

import pytest

@pytest.fixture(scope='session')
def clean_fortpy_cache(request):
    """
    Set `fortpy.settings.cache_directory` to a temporary directory during test.

    Note that you can't use built-in `tmpdir` and `monkeypatch`
    fixture here because their scope is 'function', which is not used
    in 'session' scope fixture.

    This fixture is activated in tox.ini.
    """
    import fortpy
    settings = fortpy.settings
    old = settings.cache_directory
    tmp = tempfile.mkdtemp(prefix='fortpy-test-')
    settings.cache_directory = tmp

    @request.addfinalizer
    def restore():
        settings.cache_directory = old
        shutil.rmtree(tmp)
