# README

## Model diagram

Task

| Column | Type |
| --- | --- |
| ID | serial |
| name | varchar |
| description | varchar |
| deadline | date |
| priority | varchar |
| label | varchar |
| status | integer |
| creationdatetime | timestamp |
| updatedatetime | timestamp |

User

| Column | Type
| --- | --- |
| ID | serial |
| username | varchar |
| password | varchar |
| creationdatetime | timestamp |
| updatedatetime | timestamp |

Status

| Column | Type |
| --- | --- |
| ID | serial |
| name | varchar |
