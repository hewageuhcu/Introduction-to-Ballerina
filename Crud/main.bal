import ballerina/http;
import ballerina/io;

type book record{|
int id;
string title;
string author;
|}; 

book[] books=[];

service/books on new http:Listener(8080){
resource function get .() returns book[]{
    return books;
}

//by id
 resource function get ./{int id}() returns book|error {
        foreach var book in books {
            if book.id == id {
                return book;
            }
        }
        return error("Book not found", code = 404);
    }
}