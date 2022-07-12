# Robot Framework Example
This simple example illustrates how to connect Robot Framework with TestRail using simple, yet powerful [Railflow NPI CLI](https://www.npmjs.com/package/railflow).

Please refer to the detailed documentation on [our official website](https://docs.railflow.io/docs/robot).  
You can get free 2-week evaluation license [here](https://railflow.io/register).

Repository contains a few Robot tests which uses Selenium for web UI testing.

# Running the example
## Installation
```
pip install -r requirements.txt
```

## Run tests
To run test use:

```shell
robot -d results tests/
```

It will run the tests and create reports in `results' folder.

## Uploading test results into TestRail using Railflow
Please refer to the detailed documentation on [our official website](https://docs.railflow.io/docs/robot).
