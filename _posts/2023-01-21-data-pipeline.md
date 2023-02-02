---
layout: post
title: "Data Pipeline"
summary: Data Pipeline
date: 2022-01-21
---

Incorrect data screws up data pipelines.

Data quality checks can fix these issues.

Here's how.

Data quality checks range anywhere from syntactic checks to uniqueness checks.

✅ Syntactic checks
These checks ensure that the data conforms to the specified format, such as validating that a date field is in the correct format or that a phone number contains only numeric characters.

✅ Semantic checks
These checks ensure that the data makes sense in the context of the domain, such as validating that a date of birth is not in the future or that a product code exists in the product catalog.

✅ Completeness checks
These checks ensure that all required data is present, such as checking that all mandatory fields have been filled in.

✅ Validity checks
These checks validate that the data is accurate and conforms to a set of business rules, such as checking that an email address is valid or that a credit card number passes a Luhn check.

✅ Consistency checks
These checks ensure that the data is consistent across different sources, such as checking that a customer's name and address match between different systems.

✅ Accuracy checks
These checks validate that the data is accurate according to external standards or data, such as comparing a mailing address against a reference dataset to detect errors.

✅ Uniqueness checks
These checks ensure that there are no duplicate values in the data, such as checking for duplicate customer records or unique keys.

How do I implement these checks in Python?

👉 Great Expectations
Great expectations is an open-source Python library that allows you to define and test expectations for data and data pipeline by providing an easy-to-use framework for data quality checks such as validating data types, checking for missing values, and comparing data to historical values.

👉 Pandera
Pandera supports data schema definition and validation for various dataframe types like pandas, dask, modin, and pyspark.pandas. It provides tools to check column/value types and properties, perform statistical validation, and integrate with data analysis/processing pipelines. With class-based API and pydantic-style syntax, it enables property-based testing and lazy validation. It also integrates with python tools like pydantic, fastapi, and mypy.

👉 Pydantic
Pydantic defines a data model using Python classes and provides built-in support for data validation, documentation, and settings management. Pydantic uses Python type hints to define expected types and constraints for fields in a data model, and also provides built-in validators for common data types, and ability to define custom validators.
