table 50140 MembersTable
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(50141;ID; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50142; DateOfBirth; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                DOB: Date;
            //AgeClc: Codeunit 
            begin
                DOB := Rec.DateOfBirth;
                // Message('Dateofbirth%1',DOB);
                Age := CalculateAge(DOB);
                RetiresIn := MemberRetirementAge(DOB);
            end;
        }
        field(50143; Name; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50144; Age; Integer)
        {
            DataClassification = ToBeClassified;              
            
        }
        field(50145; RetiresIn; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }  
    keys
    {
        key(PK; ID)
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
        lineNumber: Integer;
        MembersT: Record MembersTable;
    
    trigger OnInsert()
    begin
        lineNumber := 0;
        if MembersT.FindLast() then
        ID := MembersT.ID+1
        else
        ID := 1;
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
        Todays: Date;
        AgeInDays: Integer;
        AgeInYears: Decimal;
        Age: Decimal;
        Direction: text;
        currentday: Date;
    begin
        currentday := Today;
        Message('Today %1 Dateofbirth %2', currentday,DateOfBirth);
        AgeInDays := Today - DateOfBirth;
        Message('Age in days %1', AgeInDays);
        AgeInYears := AgeInDays / 365;
        Message('Age in years %1', AgeInYears);
       // Direction := '<';
        Age := Round(AgeInYears, 1, '<');
        Message('Your age is %1 years old', Age);
        // exit(Age);
    end;

    // procedure CalculateRetirementAge(CurrentAge: Date): Integer
    // var
    //     RetirementAge : Integer;
    //     RetirementYear: Integer;
    //     RetirementMonths: Integer;
    //     RetirementDays: Integer;
    //     MyAge : Integer;
    //     YearsInRetirement : Integer; 
    //     CurrentYear: Date;
    //     Year: Integer;
    // begin
    //     MyAge := CalculateAge(DateOfBirth);
    //     RetirementAge := 65;
    //     CurrentYear := Today;
    //     Year := DATE2DMY(CurrentYear,3); 
    //     RetirementYear := RetirementAge - MyAge;
    //     Message('Your years of retirement is in %1', RetirementYear);
    //     // RetirementMonths := RetirementYear * 12;
    //     // Message('Months remaining to your retirement is %1', RetirementMonths);
    //     // RetirementDays := RetirementYear * 365;
    //     // Message('Days remaining to your retirement is %1', RetirementDays);
    //     YearsInRetirement := RetirementYear + Year;
    //     Message('You will retire in %1 year', YearsInRetirement);
    // end;   
    procedure MemberRetirementAge(MemberCurrentAge: Date): Integer
    var
        TheRetirementAge: Integer;
        MembersDOB: Integer;
        RetiresIn: Integer;
    begin
        TheRetirementAge := 65;
        MembersDOB := CalculateAge(DateOfBirth);
        RetiresIn := MembersDOB + TheRetirementAge;
        Message('Your year of retirement is in %1 year', RetiresIn);        
    end; 
}