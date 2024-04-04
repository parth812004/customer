# Customer Registration Form

This is a simple customer registration form implemented in Python using Tkinter for the GUI and MySQL as the backend database.

## Description

The application allows users to perform the following operations:

- Add customer data to the database
- Delete customer data from the database
- Update customer data in the database
- Show customer data from the database

## Requirements

- Python 3.x
- Tkinter
- MySQL
- mysql-connector-python library

## Installation and Setup

1. **Python**: Install Python from the [official website](https://www.python.org/downloads/).

2. **Tkinter**: Tkinter comes pre-installed with Python. No additional installation is required.

3. **MySQL**: Install MySQL from the [official website](https://dev.mysql.com/downloads/).

4. **mysql-connector-python**: Install the mysql-connector-python library using pip:
   ```
   pip install mysql-connector-python
   ```

5. **Database Setup**: Create a MySQL database named "BANK" and a table named "Customer" with the following schema:
   ```sql
   CREATE TABLE Customer (
       customer_id INT AUTO_INCREMENT PRIMARY KEY,
       f_name VARCHAR(255),
       m_name VARCHAR(255),
       l_name VARCHAR(255),
       dob DATE,
       address VARCHAR(255),
       cifsc_code VARCHAR(255)
   );
   ```

6. **Run the Application**: Execute the Python script `customer_registration_form.py` to run the application.

## Usage

1. Run the Python script `customer_registration_form.py`.
2. Fill in the customer details in the provided fields.
3. Click on the respective buttons to perform operations such as adding, deleting, updating, or showing customer data.
4. A message box will display the result of the operation.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```

This README provides information about the project, its requirements, installation, usage instructions, and licensing details.
