from tkinter import *
from tkinter import ttk
import mysql.connector
from tkinter import messagebox

class RehabilitationCenter:
    def __init__(self, root):
        self.root = root
        self.root.title("Rehabilitasyon Merkezi Projesi")
        self.root.geometry("1540x800+0+0")

        self.hasta_tc = StringVar()
        self.hasta_adı = StringVar()
        self.hasta_soyadı = StringVar()
        self.hasta_yaş = StringVar()
        self.hasta_erkek_mi = StringVar()
        self.hasta_şehir = StringVar()
        self.hasta_mahalle = StringVar()
        self.hasta_ev_no = StringVar()
        self.merkez_id = StringVar()
        self.oda_no = StringVar()
        self.oda_tipi = StringVar()
        self.oda_kapasitesi = StringVar()
        self.merkez_adi = StringVar()
        self.merkez_sehir = StringVar()
        self.merkez_mahalle = StringVar()
        self.merkez_kapi_no = StringVar()
        self.merkez_tel_no = StringVar()
        self.program_kodu = StringVar()
        self.program_adi = StringVar()
        self.program_kac_hafta = StringVar()
        self.terapist_id = StringVar()
        self.hasta_id = StringVar()
        self.hasta_kaydi_no = StringVar()
        self.hasta_kaydi_tarih = StringVar()
        self.hasta_kaydi_teshis = StringVar()
        self.hasta_kaydi_tedavi_yontemi = StringVar()
        self.selected_id = None

        lbltitle = Label(self.root, bd=20, relief=RIDGE, text="Rehberlik Merkezi Projesi", fg="red", bg="white", font=("times new roman", 50, "bold"))
        lbltitle.pack(side=TOP, fill=X)

        # Button frame for different tables
        Buttonframe = Frame(self.root, bd=20, relief=RIDGE)
        Buttonframe.place(x=0, y=100, width=1530, height=70)

        btnHasta = Button(Buttonframe, text="Hasta", font=("arial", 12, "bold"), bg="blue", fg="white", width=12, command=self.show_hasta)
        btnHasta.grid(row=0, column=0)

        btnTerapist = Button(Buttonframe, text="Terapist", font=("arial", 12, "bold"), bg="blue", fg="white", width=12, command=self.show_terapist)
        btnTerapist.grid(row=0, column=1)

        btnOda = Button(Buttonframe, text="Oda", font=("arial", 12, "bold"), bg="blue", fg="white", width=12, command=self.show_oda)
        btnOda.grid(row=0, column=2)

        btnMerkez = Button(Buttonframe, text="Merkez", font=("arial", 12, "bold"), bg="blue", fg="white", width=12, command=self.show_merkez)
        btnMerkez.grid(row=0, column=3)

        btnProgram = Button(Buttonframe, text="Program", font=("arial", 12, "bold"), bg="blue", fg="white", width=12, command=self.show_program)
        btnProgram.grid(row=0, column=4)

        btnProgram = Button(Buttonframe, text="Hasta Kaydı", font=("arial", 12, "bold"), bg="blue", fg="white", width=12, command=self.show_hasta_kaydı)
        btnProgram.grid(row=0, column=5)

        btnProgram = Button(Buttonframe, text="Trigger", font=("arial", 12, "bold"), bg="blue", fg="white", width=12, command=self.show_trigger)
        btnProgram.grid(row=0, column=6)

        btnProgram = Button(Buttonframe, text="Hasta-Terapist View", font=("arial", 12, "bold"), bg="blue", fg="white", width=15, command=self.show_view1)
        btnProgram.grid(row=0, column=7)

        btnProgram = Button(Buttonframe, text="Hasta Kaydı View", font=("arial", 12, "bold"), bg="blue", fg="white", width=15, command=self.show_view2)
        btnProgram.grid(row=0, column=8)    
                   
        btnProgram = Button(Buttonframe, text="Hasta Listesi View", font=("arial", 12, "bold"), bg="blue", fg="white", width=15, command=self.show_view3)
        btnProgram.grid(row=0, column=9)        

        # Dataframe to show table data
        self.Detailsframe = Frame(self.root, bd=20, relief=RIDGE)
        self.Detailsframe.place(x=0, y=200, width=1530, height=500)

        self.create_treeview()

        # Button frame for CRUD operations
        CRUDframe = Frame(self.root, bd=20, relief=RIDGE)
        CRUDframe.place(x=0, y=700, width=1530, height=70)


        btnSave = Button(CRUDframe, text="Ekle", font=("arial", 12, "bold"), bg="green", fg="white", width=23, command=self.insert_data)
        btnSave.grid(row=0, column=0)

        btnUpdate = Button(CRUDframe, text="Güncelle", font=("arial", 12, "bold"), bg="blue", fg="white", width=23, command=self.open_update_window)
        btnUpdate.grid(row=0, column=1)

        btnDelete = Button(CRUDframe, text="Sil", font=("arial", 12, "bold"), bg="red", fg="white", width=23, command=self.delete_data)
        btnDelete.grid(row=0, column=2)

        # btnClear = Button(CRUDframe, text="Temizle", font=("arial", 12, "bold"), bg="grey", fg="white", width=23, command=self.clear_data)
        # btnClear.grid(row=0, column=3)






    def create_treeview(self):
        self.tree = ttk.Treeview(self.Detailsframe)
        self.tree.pack(fill=BOTH, expand=1)

        self.scroll_x = ttk.Scrollbar(self.Detailsframe, orient=HORIZONTAL, command=self.tree.xview)
        self.scroll_x.pack(side=BOTTOM, fill=X)
        self.scroll_y = ttk.Scrollbar(self.Detailsframe, orient=VERTICAL, command=self.tree.yview)
        self.scroll_y.pack(side=RIGHT, fill=Y)
        self.tree.configure(xscrollcommand=self.scroll_x.set, yscrollcommand=self.scroll_y.set)

        self.tree.bind("<ButtonRelease-1>", self.get_cursor)




    def get_cursor(self, event):
        cursor_row = self.tree.focus()
        contents = self.tree.item(cursor_row)
        row = contents['values']
        if row:
            self.selected_id = row[0]
            self.hasta_tc.set(row[1])
            self.hasta_adı.set(row[2])
            self.hasta_soyadı.set(row[3])
            self.hasta_yaş.set(row[4])
            self.hasta_erkek_mi.set(row[5])
            self.hasta_şehir.set(row[6])
            self.hasta_mahalle.set(row[7])
            self.hasta_ev_no.set(row[8])
            self.merkez_id.set(row[9])




    def show_hasta(self):
        self.clear_treeview()
        self.current_table = "hasta"
        columns = ("hasta_id", "hasta_tc", "hasta_adı", "hasta_soyadı", "hasta_yaş", "hasta_erkek_mi", "hasta_şehir", "hasta_mahalle", "hasta_ev_no", "merkez_id")
        self.tree["columns"] = columns
        for col in columns:
            self.tree.heading(col, text=col)
            self.tree.column(col, width=100)
        self.tree["show"] = "headings"
        self.fetch_data()




    def show_terapist(self):
        self.clear_treeview()
        self.current_table = "terapist"
        columns = ("terapist_id", "terapist_tc", "terapist_adi", "terapist_soyadi", "terapist_uzmanlik", "hasta_id", "merkez_id")
        self.tree["columns"] = columns
        for col in columns:
            self.tree.heading(col, text=col)
            self.tree.column(col, width=100)
        self.tree["show"] = "headings"
        self.fetch_data()




    def show_oda(self):
        self.clear_treeview()
        self.current_table = "oda"
        columns = ("oda_id", "oda_no", "oda_tipi", "oda_kapasitesi", "hasta_id", "merkez_id")
        self.tree["columns"] = columns
        for col in columns:
            self.tree.heading(col, text=col)
            self.tree.column(col, width=100)
        self.tree["show"] = "headings"
        self.fetch_data()




    def show_merkez(self):
        self.clear_treeview()
        self.current_table = "merkez"
        columns = ("merkez_id", "merkez_adi", "merkez_sehir", "merkez_mahalle", "merkez_kapi_no", "merkez_tel_no")
        self.tree["columns"] = columns
        for col in columns:
            self.tree.heading(col, text=col)
            self.tree.column(col, width=100)
        self.tree["show"] = "headings"
        self.fetch_data()




    def show_program(self):
        self.clear_treeview()
        self.current_table = "program"
        columns = ("program_id", "program_kodu", "program_adi", "program_kac_hafta", "terapist_id", "hasta_id", "merkez_id")
        self.tree["columns"] = columns
        for col in columns:
            self.tree.heading(col, text=col)
            self.tree.column(col, width=100)
        self.tree["show"] = "headings"
        self.fetch_data()




    def show_hasta_kaydı(self):
        self.clear_treeview()
        self.current_table = "hasta_kaydı"
        columns = ("hasta_kaydı_id", "hasta_kaydı_no", "hasta_kaydı_tarih", "hasta_kaydı_teşhis", "hasta_kaydı_tedavi_yöntemi", "hasta_id")
        self.tree["columns"] = columns
        for col in columns:
            self.tree.heading(col, text=col)
            self.tree.column(col, width=100)
        self.tree["show"] = "headings"
        self.fetch_data()   



    def show_trigger(self):
        self.clear_treeview()
        self.current_table = "log"
        columns = ("id", "mesaj", "hasta_kaydı_tarih", "tarih")
        self.tree["columns"] = columns
        for col in columns:
            self.tree.heading(col, text=col)
            self.tree.column(col, width=100)
        self.tree["show"] = "headings"
        self.fetch_data()   



    def show_view1(self):
        self.clear_treeview()
        self.current_table = "hasta_terapist"
        columns = ("hasta_id", "hasta_tc", "hasta_adı", "hasta_soyadı" , "hasta_yaş" ,"hasta_erkek_mi" , "terapist_id" , "terapist_tc" , "terapist_adı",  "terapist_soyadı" , "terapist_uzmanlık")
        self.tree["columns"] = columns
        for col in columns:
            self.tree.heading(col, text=col)
            self.tree.column(col, width=100)
        self.tree["show"] = "headings"
        self.fetch_data()   



    def show_view2(self):
        self.clear_treeview()
        self.current_table = "hastakaydı"
        columns = ("hasta_id"  , "hasta_tc"  ,"hasta_adı"  ,"hasta_soyadı" ,"hasta_yaş" ,"hasta_erkek_mi" ,"terapist_id" ,"terapist_tc" ,"terapist_adı" ,"terapist_soyadı" ,"terapist_uzmanlık" ,"hasta_kaydı_id"  ,"hasta_kaydı_no"  ,"hasta_kaydı_tarih"  ,"hasta_kaydı_teşhis" ,"hasta_kaydı_tedavi_yöntemi")
        self.tree["columns"] = columns
        for col in columns:
            self.tree.heading(col, text=col)
            self.tree.column(col, width=100)
        self.tree["show"] = "headings"
        self.fetch_data()   



    def show_view3(self):
        self.clear_treeview()
        self.current_table = "hastalistesi"
        columns = ("hasta_id"  , "hasta_tc"  ,"hasta_adı"  ,"hasta_soyadı" ,"hasta_yaş" ,"hasta_erkek_mi")
        self.tree["columns"] = columns
        for col in columns:
            self.tree.heading(col, text=col)
            self.tree.column(col, width=100)
        self.tree["show"] = "headings"
        self.fetch_data()                   




    def fetch_data(self):
        conn = mysql.connector.connect(host="localhost", username="root", password="bedo6175", database="rehberlikmerkezi")
        cursor = conn.cursor()
        cursor.execute(f"SELECT * FROM {self.current_table}")
        rows = cursor.fetchall()
        if len(rows) != 0:
            for row in rows:
                self.tree.insert("", END, values=row)
        conn.commit()
        conn.close()




    def insert_data(self):
            insert_window = Toplevel(self.root)
            insert_window.title("Kayıt Ekle")
            insert_window.geometry("400x400")

            labels = []
            entries = []
            current_table_columns = []

            if self.current_table == "hasta":
                self.current_table = "hasta"
                current_table_columns = ["hasta_id", "hasta_tc", "hasta_adı", "hasta_soyadı", "hasta_yaş", "hasta_erkek_mi", "hasta_şehir", "hasta_mahalle", "hasta_ev_no", "merkez_id"]

            elif self.current_table == "terapist":
                self.current_table = "terapist" 
                current_table_columns = ["terapist_id", "terapist_tc", "terapist_adı", "terapist_soyadı", "terapist_uzmanlık", "hasta_id", "merkez_id"]

            elif self.current_table == "oda":
                self.current_table = "oda"                 
                current_table_columns = ["oda_id", "oda_no", "oda_tipi", "oda_kapasitesi", "hasta_id", "merkez_id"]

            elif self.current_table == "merkez":
                self.current_table = "merkez"                 
                current_table_columns = ["merkez_id", "merkez_adı", "merkez_şehir", "merkez_mahalle", "merkez_kapı_no", "merkez_tel_no"]

            elif self.current_table == "program":
                self.current_table = "program"                 
                current_table_columns = ["program_id", "program_kodu", "program_adı", "program_kac_hafta", "terapist_id", "hasta_id", "merkez_id"]

            elif self.current_table == "hasta_kaydı":
                self.current_table = "hasta_kaydı"                 
                current_table_columns = ["hasta_kaydı_id", "hasta_kaydı_no", "hasta_kaydı_tarih", "hasta_kaydı_teşhis", "hasta_kaydı_tedavi_yöntemi", "hasta_id"]

            for index, column in enumerate(current_table_columns):
                label = Label(insert_window, text=column, font=("arial", 12, "bold"))
                label.grid(row=index, column=0, padx=10, pady=5)
                entry = Entry(insert_window, font=("arial", 12, "bold"))
                entry.grid(row=index, column=1, padx=10, pady=5)
                labels.append(label)
                entries.append(entry)

            def save_new_data():
                data = []
                for entry in entries:
                    data.append(entry.get())
                data_tuple = tuple(data)

                con = mysql.connector.connect(host="localhost", user="root", password="bedo6175", database="rehberlikmerkezi")
                cur = con.cursor()
                columns_str = ", ".join(current_table_columns)
                placeholders = ", ".join(["%s"] * len(current_table_columns))
                query = f"INSERT INTO {self.current_table} ({columns_str}) VALUES ({placeholders})"
                cur.execute(query, data_tuple)
                con.commit()
                con.close()
                self.fetch_data()
                insert_window.destroy()

            btnSave = Button(insert_window, text="Kaydet", font=("arial", 12, "bold"), bg="green", fg="white", command=save_new_data)
            btnSave.grid(row=len(current_table_columns), columnspan=2, pady=20)






    def open_update_window(self):
            selected = self.tree.focus()
            values = self.tree.item(selected, 'values')
                
            if not values:
                messagebox.showerror("Hata", "Güncellemek için bir veri seçiniz")
                return
                
            self.selected_id = values[0]  # Seçili satırın ID değerini kaydet
                
            self.update_window = Toplevel(self.root)
            self.update_window.title("Veri Güncelle")
            self.update_window.geometry("400x400")

            table_columns = {
                        "hasta": ["hasta_id", "hasta_tc", "hasta_adı", "hasta_soyadı", "hasta_yaş", "hasta_erkek_mi", "hasta_şehir", "hasta_mahalle", "hasta_ev_no", "merkez_id"],
                        "terapist": ["terapist_id", "terapist_tc", "terapist_adı", "terapist_soyadı", "terapist_uzmanlık", "hasta_id", "merkez_id"],
                        "oda": ["oda_id", "oda_no", "oda_tipi", "oda_kapasitesi", "hasta_id", "merkez_id"],
                        "merkez": ["merkez_id", "merkez_adı", "merkez_şehir", "merkez_mahalle", "merkez_kapı_no", "merkez_tel_no"],
                        "program": ["program_id", "program_kodu", "program_adı", "program_kac_hafta", "terapist_id", "hasta_id", "merkez_id"],
                        "hasta_kaydı": ["hasta_kaydı_id", "hasta_kaydı_no", "hasta_kaydı_tarih", "hasta_kaydı_teşhis", "hasta_kaydı_tedavi_yöntemi", "hasta_id"]
                        }

            self.update_entries = {}
                    
            for i, col in enumerate(table_columns[self.current_table]):
                lbl = Label(self.update_window, text=col)
                lbl.grid(row=i, column=0, padx=10, pady=10)
                self.update_entries[col] = Entry(self.update_window)
                self.update_entries[col].insert(0, values[i])  # İlk sütun ID olduğu için atlama yap
                self.update_entries[col].grid(row=i, column=1, padx=10, pady=10)
                
            btnUpdate = Button(self.update_window, text="Güncelle", command=lambda: self.update_data(table_columns[self.current_table]))
            btnUpdate.grid(row=len(table_columns[self.current_table]), column=1, pady=10)       
   
        
    def update_data(self , columns):
            values = [self.update_entries[col].get() for col in columns]
        
            if '' in values:
                messagebox.showerror("Hata", "Tüm alanları doldurunuz")
                return
        
            conn = mysql.connector.connect(host="localhost", user="root", password="bedo6175", database="rehberlikmerkezi")
            cursor = conn.cursor()

            query = f"UPDATE {self.current_table} SET {', '.join([f'{col}=%s' for col in columns])} WHERE hasta_id=%s"  

            cursor.execute(query, values + [self.selected_id])
            conn.commit()
            conn.close()

            self.update_window.destroy()
            self.fetch_data()



   





    def delete_data(self):
        if self.selected_id:
            conn = mysql.connector.connect(host="localhost", username="root", password="bedo6175", database="rehberlikmerkezi")
            cursor = conn.cursor()
            if self.current_table == "hasta":
                self.clear_treeview()
                self.current_table = "hasta"
                cursor.execute("DELETE FROM hasta WHERE hasta_id=%s", (self.selected_id,))

            if self.current_table == "terapist":
                self.clear_treeview()
                self.current_table = "hasta"
                cursor.execute("DELETE FROM terapist WHERE terapist_id=%s", (self.selected_id,))

            if self.current_table == "hasta_kaydı":
                self.clear_treeview()
                self.current_table = "hasta_kaydı"
                cursor.execute("DELETE FROM hasta_kaydı WHERE hasta_kaydı_id    =%s", (self.selected_id,))

            if self.current_table == "merkez":
                self.clear_treeview()
                self.current_table = "merkez"
                cursor.execute("DELETE FROM merkez WHERE merkez_id=%s", (self.selected_id,))   

            if self.current_table == "oda":
                self.clear_treeview()
                self.current_table = "oda"
                cursor.execute("DELETE FROM oda WHERE oda_id=%s", (self.selected_id,))  

            if self.current_table == "program":
                self.clear_treeview()
                self.current_table = "program"
                cursor.execute("DELETE FROM program WHERE program_id=%s", (self.selected_id,))      
             
            conn.commit()
            self.fetch_data()
            self.clear_data()
            conn.close()




    def clear_data(self):
        self.hasta_tc.set("")
        self.hasta_adı.set("")
        self.hasta_soyadı.set("")
        self.hasta_yaş.set("")
        self.hasta_erkek_mi.set("")
        self.hasta_şehir.set("")
        self.hasta_mahalle.set("")
        self.hasta_ev_no.set("")
        self.merkez_id.set("")
        self.selected_id = None




    def clear_treeview(self):
        for item in self.tree.get_children():
            self.tree.delete(item)



if __name__ == "__main__":
    root = Tk()
    obj = RehabilitationCenter(root)
    root.mainloop()