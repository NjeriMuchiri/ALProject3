table 50130 MyFixedAssets
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(50121; "Member No."; code[20])
        {
            DataClassification = ToBeClassified;
        }
         field(50122; "TheDescription"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }
    
    keys
    {
        key(pk1; "Member No.")
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
