import tkinter as tk
from tkinter import messagebox
import mysql.connector
from tkinter import font
from tkinter import ttk


def add_data():
    customer_id = customer_id_entry.get()
    f_name = f_name_entry.get()
    m_name = m_name_entry.get()
    l_name = l_name_entry.get()
    dob = dob_entry.get()
    address = address_entry.get()
    cifsc_code = cifsc_code_entry.get()

    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="premparth2004",
        database="Bank"
    )
    cursor = mydb.cursor()
    sql = "INSERT INTO Customer (customer_id, f_name,m_name,l_name, dob,address, cifsc_code) VALUES (%s,%s,%s, %s,%s, %s, %s)"
    val = (customer_id, f_name, m_name, l_name, dob, address, cifsc_code)
    try:
        cursor.execute(sql, val)
        mydb.commit()
        messagebox.showinfo("Success", "Data added successfully!")
    except mysql.connector.Error as err:
        messagebox.showerror("Error", f"Error: {err}")
    mydb.close()
    customer_id_entry.delete(0, tk.END)
    f_name_entry.delete(0, tk.END)
    m_name_entry.delete(0, tk.END)
    l_name_entry.delete(0, tk.END)
    dob_entry.delete(0, tk.END)
    address_entry.delete(0, tk.END)
    cifsc_code_entry.delete(0, tk.END)


def delete_data():
    customer_id = customer_id_entry.get()
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="premparth2004",
        database="BANK"
    )
    cursor = mydb.cursor()
    sql = "DELETE FROM Customer WHERE customer_id = %s"
    val = (customer_id,)
    try:
        cursor.execute(sql, val)
        mydb.commit()
        messagebox.showinfo("Success", "Data deleted successfully!")
    except mysql.connector.Error as err:
        messagebox.showerror("Error", f"Error: {err}")
    mydb.close()
    customer_id_entry.delete(0, tk.END)


def update_data():
    customer_id = customer_id_entry.get()
    f_name = f_name_entry.get()
    m_name = m_name_entry.get()
    l_name = l_name_entry.get()
    dob = dob_entry.get()
    address = address_entry.get()
    cifsc_code = cifsc_code_entry.get()

    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="premparth2004",
        database="BANK"
    )
    cursor = mydb.cursor()
    sql = "UPDATE Customer SET f_name = %s, m_name = %s,l_name = %s,dob = %s, address = %s, cifsc_code = %s WHERE customer_id = %s"
    val = (f_name, m_name, l_name, dob, address, cifsc_code, customer_id)
    try:
        cursor.execute(sql, val)
        mydb.commit()
        messagebox.showinfo("Success", "Data updated successfully!")
    except mysql.connector.Error as err:
        messagebox.showerror("Error", f"Error: {err}")
    mydb.close()
    customer_id_entry.delete(0, tk.END)
    f_name_entry.delete(0, tk.END)
    m_name_entry.delete(0, tk.END)
    l_name_entry.delete(0, tk.END)
    dob_entry.delete(0, tk.END)
    address_entry.delete(0, tk.END)
    cifsc_code_entry.delete(0, tk.END)


def select_data():
    customer_id = customer_id_entry.get()
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="premparth2004",
        database="BANK"
    )
    try:
        cursor = mydb.cursor()
        sql = " select * from Customer where customer_id=%s;"
        val = (customer_id,)
        cursor.execute(sql, val)
        result = cursor.fetchone()
    except mysql.connector.Error as err:
        messagebox.showerror("Error", f"Error: {err}")


    if result:
        messagebox.showinfo("Customer Details",f"Customer ID: {result[0]}\n First name: {result[1]}\n Middle name: {result[2]}\n Last name: {result[3]}\nDOB: {result[4]}\n Address: {result[5]}\nIFSC Code: {result[6]}")
    else:
        messagebox.showinfo("Error", "Customer not found.")
    mydb.close()


root = tk.Tk()
root.title("Add Customer Data to Database Named BANK")
screen_width = root.winfo_screenwidth()
screen_height = root.winfo_screenheight()
root.geometry(f"{screen_width}x{screen_height}")
root.config(bg="#555555")

title_font = font.Font(family="Verdana", size=30, weight="bold")
label_font = font.Font(family="Century Gothic", size=25, weight="bold")
entry_font = font.Font(family="Cambria", size=20)
btn_font = font.Font(family="Trebuchet MS", size=20)

header_label = tk.Label(root, text="ADD CUSTOMER DETAILS", bg="#555555", font=title_font, foreground="#FFFFFF")
header_label.place(relx=0.5, rely=0.05, anchor="center")

frame = tk.Frame(root, bg="white")
frame.place(relx=0.5, rely=0.5, relwidth=0.8, relheight=0.8, anchor="center")

tk.Label(frame, text="Customer ID:", bg="white", font=label_font).grid(row=0, column=0, padx=100, pady=20)
tk.Label(frame, text="First name:", bg="white", font=label_font).grid(row=1, column=0, padx=10, pady=10)
tk.Label(frame, text="Middle name:", bg="white", font=label_font).grid(row=2, column=0, padx=10, pady=10)
tk.Label(frame, text="Last name:", bg="white", font=label_font).grid(row=3, column=0, padx=10, pady=10)
tk.Label(frame, text="DOB:", bg="white", font=label_font).grid(row=4, column=0, padx=10, pady=10)
tk.Label(frame, text="Address:", bg="white", font=label_font).grid(row=5, column=0, padx=10, pady=10)
tk.Label(frame, text="IFSC Code:", bg="white", font=label_font).grid(row=6, column=0, padx=10, pady=10)

style = ttk.Style()
style.configure('Custom.TEntry', borderwidth=2, foreground='Black', font=label_font, padding=5, relief='ridge',cursor='arrow')

customer_id_entry = ttk.Entry(frame, font=entry_font, width=20, style='Custom.TEntry')
customer_id_entry.grid(row=0, column=1, padx=10, pady=10)
f_name_entry = ttk.Entry(frame, font=entry_font, width=20, style='Custom.TEntry')
f_name_entry.grid(row=1, column=1, padx=10, pady=10)
m_name_entry = ttk.Entry(frame, font=entry_font, width=20, style='Custom.TEntry')
m_name_entry.grid(row=2, column=1, padx=10, pady=10)
l_name_entry = ttk.Entry(frame, font=entry_font, width=20, style='Custom.TEntry')
l_name_entry.grid(row=3, column=1, padx=10, pady=10)
dob_entry = ttk.Entry(frame, font=entry_font, width=20, style='Custom.TEntry')
dob_entry.grid(row=4, column=1, padx=10, pady=10)
address_entry = ttk.Entry(frame, font=entry_font, width=20, style='Custom.TEntry')
address_entry.grid(row=5, column=1, padx=10, pady=10)
cifsc_code_entry = ttk.Entry(frame, font=entry_font, width=20, style='Custom.TEntry')
cifsc_code_entry.grid(row=6, column=1, padx=10, pady=10)

add_button = tk.Button(frame, text="Add Data", command=add_data, bg="lightblue", fg="black", font=btn_font)
add_button.grid(row=8, column=0,  padx=5, pady=10)
delete_button = tk.Button(frame, text="Delete Data", command=delete_data, bg="lightcoral", fg="black", font=btn_font)
delete_button.grid(row=8, column=2,  padx=5, pady=10)
update_button = tk.Button(frame, text="Update Data", command=update_data, bg="lightgreen", fg="black", font=btn_font)
update_button.grid(row=10, column=0,  padx=5, pady=10)
select_button = tk.Button(frame, text="Show Data", command=select_data, bg="#FADA5E", fg="black", font=btn_font)
select_button.grid(row=10, column=2,  padx=5, pady=10)

root.mainloop()