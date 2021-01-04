sudo apt install python3.9-dev python3.9-pip python3.9-venv
python3.9 -m venv tensorflow39
source tensorflow39/bin/activate
python -m pip install numpy wheel keras_preprocessing

sudo apt install golang-go
go get github.com/bazelbuild/bazelisk

export PATH=$PATH:$(go env GOPATH)/bin

./configure

bazelisk build tensorflow/tools/pip_package:build_pip_package

./bazel-bin/tensorflow/tools/pip_package/build_pip_package ./dist/tensorflow_pkg

pip install ./dist/tensorflow_pkg/tensorflow-2.4.0-cp39-cp39-linux_x86_64.whl
