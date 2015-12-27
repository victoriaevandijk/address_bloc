 require_relative '../models/address_book.rb'
 
 RSpec.describe AddressBook do  
  let(:book) { AddressBook.new }
  
  def check_entry(entry, expected_name, expected_number, expected_email)
   expect(entry.name).to eq expected_name
   expect(entry.phone_number).to eq expected_number
   expect(entry.email).to eq expected_email
  end
  
   context "attributes" do
     it "should respond to entries" do
       expect(book).to respond_to(:entries)
     end
 
     it "should initialize entries as an array" do
       expect(book.entries).to be_a(Array)
     end
  
     it "should initialize entries as empty" do
       expect(book.entries.size).to eq 0
     end
   end
 
   context ".add_entry" do
     it "adds only one entry to the address book" do 
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       
       expect(book.entries.size).to eq 1
     end
 
     it "adds the correct information to entries" do
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       new_entry = book.entries[0]
 
       expect(new_entry.name).to eq 'Ada Lovelace'
       expect(new_entry.phone_number).to eq '010.012.1815'
       expect(new_entry.email).to eq 'augusta.king@lovelace.com'
     end
   end
 
  context "#remove_entry" do
       it "removes an entry using the entry values" do

         book.add_entry("Torie van Dijk", "937-684-3609", "victoriaevandijk@gmail.com")
         name = 'Ada Lovelace'
         phone_number = '010.012.1815'
         email_address = 'august.king@lovelace.com'
         book.add_entry(name, phone_number, email_address)

         expect(book.entries.size).to eq 2
         book.remove_entry(name, phone_number, email_address)
         expect(book.entries.size).to eq 1
       end
   end
   
   describe "import_from_csv" do
    it "imports the correct number of entries" do
     book.import_from_csv("entries.csv")
     book_size = book.entries.size
     
     expect(book_size).to eq 5
    end
    
    it "imports the furst entry" do
     book.import_from_csv("entries.csv")
     entry_one = book.entries[0]
    end
    
    
     it "imports the 2nd entry" do
       book.import_from_csv("entries.csv")
       entry_two = book.entries[1]
     end
 
     it "imports the 3rd entry" do
       book.import_from_csv("entries.csv")
       entry_three = book.entries[2]
      end
 
     it "imports the 4th entry" do
       book.import_from_csv("entries.csv")
       entry_four = book.entries[3]
      end
 
     it "imports the 5th entry" do
       book.import_from_csv("entries.csv")
       entry_five = book.entries[4]
     end
   end
   
   describe "import_from_csv" do
    it "imports the correct number of entries" do
     book.import_from_csv("entries_2.csv")
     book_size = book.entries.size
     
     expect(book_size).to eq 3
    end
    
    it "imports the furst entry" do
     book.import_from_csv("entries_2.csv")
     entry_one = book.entries[0]
    end
    
    
     it "imports the 2nd entry" do
       book.import_from_csv("entries_2.csv")
       entry_two = book.entries[1]
     end
 
     it "imports the 3rd entry" do
       book.import_from_csv("entries_2.csv")
       entry_three = book.entries[2]
     end
    end

 end