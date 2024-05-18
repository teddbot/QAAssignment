
# Automation Template using Robot Framework and Performance Tests using k6

## API Test Automation using Robot Framework

Python: Robot Framework is a Python-based automation framework, so you will need to install Python on your computer. You can download the latest version of Python from the official Python website (https://www.python.org/downloads/).

```bash
    pip install robotframework  
    pip install robotframework-jsonlibrary
    pip install robotframework-requests
    pip install robotframework-collections
    pip install robotframework-seleniumlibrary
    pip install urllib3
    pip install robotframework-stringformat

```
Virtual Environment (Venv, Pipenv, Virtualenv)

#### Tags
Tags are a simple and powerful way of classifying test cases.
They can be used at least for the following purposes:

1. Tags are shown in test reports, logs, and, of course, in the test data, so they provide metadata to test cases.
2. Statistics about test cases (total, passed, failed are automatically collected based on tags).
3. With tags, you can include or exclude test cases to be executed.
4. With tags, you can specify which test cases should be skipped.

Types of Tags:
1. Smoke
2. Regression
3. Sanity

For example, to execute a Smoke test, use the following command when you are in the API folder:
```bash
robot -d results -i Smoke Test_1
```
# Performance Tests using k6

k6 has packages for Linux, Mac, and Windows. Alternatively, you can use a Docker container or a standalone binary. 
Refer to the link under the Reference tab for installation across different devices
```
k6 run /path/to/filename.js
```

## Improvements
Use of AI-powered tools integrated to a DataLake, to identify defects and bugs and improve the quality of the application being tested. 
We can come up with self-healing test cases. These can automatically repair themselves when broken. They use algorithms that adapt to changes in an application's interface to ensure that tests remain valid and effective. This can reduce maintenance for testing teams. 


## References

https://medium.com/geekculture/setting-up-python-environment-in-macos-using-pyenv-and-pipenv-116293da8e72

https://www.pythontutorial.net/python-basics/install-pipenv-windows/

https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/

https://k6.io/docs/get-started/installation/

https://prakat.com/industry-news/testing-data-lake/#:~:text=A%20data%20lake%20is%20a,is%20an%20object%20storage%20service.


## Contributors

 - Teddy Nzioka
