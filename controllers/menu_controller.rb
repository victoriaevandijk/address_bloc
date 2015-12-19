require_relative '../models/address_book'

class MenuController
    attr_accessor :address_book
    
    def initialize
        @address_book = AddressBook.new
    end
    
    def main_menu
        puts "Main Menu - #{@address_book.entries.count} entries"
        puts "1 - View all entries"
        puts "2 - Create an entry"
        puts "3 - Search for an entry"
        puts "4 - Import entries from a CSV"
        puts "5 - View Entry Number n"
        puts "6 - Exit"
        puts "Enter your selection: "
        
        selection = gets.to_i
        puts "You picked #{selection}"
        
        case selection
        when 1
            system "clear"
            view_all_entries
            main_menu
         when 2
            system "clear"
            create_entry
            main_menu
        when 3
            system "clear"
            search_entries
            main_menu
        when 4
            system "clear"
            read_csv
            main_menu
        when 5
            system "clear"
            filter_entries
            main_menu
        when 6
            puts "Goodbye!"
            exit(0)
        else
            system "clear"
            puts "Sorry, that is not a valid input"
            main_menu
        end
    end
    
    def view_all_entries
        @address_book.entries.each_with_index do |entry, index|
            system "clear"
            puts "Entry # #{index+1}"
            puts entry.to_s
            
            entry_submenu(entry)
        end
        
        system "clear"
        puts "End of entries"
    end
    
    def create_entry
        system "clear"
        puts "New AddressBloc Entry"
        
        print "Name: "
        name = gets.chomp
        print "Phone number: "
        phone_number = gets.chomp
        print "Email: "
        email = gets.chomp
        
        @address_book.add_entry(name, phone_number, email)
        
        system "clear"
        puts "New entry generated"
        puts "Your entry is assigned to number: #{@address_book.entries.count}"
    end
    
    def search_entries
    end
    
    def read_csv
    end
    
    def filter_entries
         puts "Enter the number of your entry: "
        number = gets.chomp.to_i
        
        if number <= @address_book.entries.count
            puts @address_book.entries[number-1]
            puts "Press enter to return to the main menu"
            gets.chomp
            system "clear"
        else
            puts "#{number} is not a vaild entry number"
            filter_entries
        end
    end
    
    def entry_submenu(entry)
        puts "n - next entry"
        puts "d - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"
        
        selection = gets.chomp
        
        case selection
        
        when "n"
        when "d"
        when "e"
        when "m"
            system "clear"
            main_menu
        else
            system "clear"
            puts "#{selection} is not a valid input"
            entrie_submenu(entry)
        end
    end
end