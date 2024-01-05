table 50110 BufferFixedAssetsTable
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(50111; "No."; code[20])
        {
            DataClassification = ToBeClassified;  
        }
            field(50112; "Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(pk1; "No.")
        {
            Clustered = true;
        }
    }
    
    fieldgroups
    {
        // Add changes to field groups here
    }
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}