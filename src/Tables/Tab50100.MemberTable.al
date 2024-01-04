table 50100 MyTable
{
    DataClassification = ToBeClassified;

    fields
    {
        //  field(50104; ID; Integer)
        // {
        //     DataClassification = ToBeClassified;
        //     AutoIncrement=true;
        // }
        field(50105; DateOfBirth; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                DOB: Date;
            //AgeClc: Codeunit 
            begin
                DOB := Rec.DateOfBirth;
                CalculateAge(DOB);
            end;
        }
        field(50106; Name; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    // keys
    // {
    //     key(PK; ID )
    //     {
    //         Clustered = true;
    //     }
    // }

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

    procedure CalculateAge(DateOfBirth: Date): Integer
    var
        Today: Date;
        AgeInDays: Integer;
        AgeInYears: Decimal;
        Age: Integer;
        Direction: text;
    begin
        AgeInDays := Today - DateOfBirth;
        AgeInYears := AgeInDays / 365;
        Direction := '<';
        Age := Round(AgeInYears, 1, Direction);
        Message('Your age is %1 years old', Age);
        // exit(Age);
    end;
}

