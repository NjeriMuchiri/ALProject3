tableextension 50120 MyFixedAssets extends "Fixed Asset"
{
    fields
    {
        field(50121; "Member No."; code[20])
        {
            DataClassification=ToBeClassified;
            Caption = 'MemNo.';
            Editable = false;
            TableRelation="Fixed Asset";
            trigger OnValidate()
            var
            MemNo: Record "Fixed Asset";
            begin
                MemNo.get("No.");
                MemNo.get(Description);
                "Member No." := MemNo."No.";
                TheDescription := MemNo.Description;
            end;
        }
        field(50122; "TheDescription"; Text[100])
        {
            DataClassification=ToBeClassified;
        }
    }
    
    keys
    {
        key(pk1; "Member No.")
        {
        }
        // Add changes to keys here
    }
    
    fieldgroups
    {
        // Add changes to field groups here
    }
    
    var
        myInt: Integer;
}