{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pyusb,
  tqdm,
  libusb1,
  setuptools,
  setuptools-git-versioning,
  pythonOlder,
}:

buildPythonPackage rec {
  pname = "pyfwup";
  version = "0.4.0";

  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "greatscottgadgets";
    repo = "pyfwup";
    rev = "refs/tags/${version}";
    hash = "sha256-JSaAEGobdLqpSj9yvKrAsXfdkHpXSCcuGYRxz2QJqck=";
  };

  dependencies = [
    pyusb
    tqdm
    libusb1
  ];

  build-system = [
    setuptools
    setuptools-git-versioning
  ];

  pythonImportsCheck = [
    "fwup"
    "fwup_utils"
  ];

  meta = {
    description = "Python FirmWare UPgrader";
    homepage = "https://github.com/greatscottgadgets/pyfwup";
    license = lib.licenses.bsd3;
    maintainers = [ lib.maintainers.msanft ];
  };
}
