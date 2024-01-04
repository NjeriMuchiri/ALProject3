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
                Message('Your Age is %1',CalculateAge(DateOfBirth));
                MemAge := CalculateAge(DateOfBirth);
                RetiresIn := MemberRetirementAge(DateOfBirth);
                DateOfDeath := MemberDateOfDeath(DateOfBirth);
            end;
        }
        field(50143; Name; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50144; MemAge; Integer)
        {
            DataClassification = ToBeClassified;              
            
        }
        field(50145; RetiresIn; Integer)
        {
            DataClassification = ToBeClassified;
        }
         field(50146; DateOfDeath; Integer)
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
        Year: Integer;
    begin
        currentday := Today;
        Year := Date2DMY(DateOfBirth,3);
        Message('Today %1 Dateofbirth %2', currentday,Year);
        AgeInDays := Today - DateOfBirth;
        Message('Age in days %1', AgeInDays);
        AgeInYears := AgeInDays / 365;
        Message('Age in years %1', AgeInYears);
       // Direction := '<';
        Age := Round(AgeInYears, 1, '<');
        Message('Your age is %1 years old', Age);
        exit(Age);
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
        DateOfretirement: Date;
        Year: Integer;
    begin
        TheRetirementAge := 65;
        MembersDOB := CalculateAge(DateOfBirth);
        DateOfretirement := CalcDate(Format(TheRetirementAge)+'Y',DateOfBirth);
        RetiresIn := Date2DMY(DateOfretirement,3);
        Message('Your year of retirement is in %1 year', RetiresIn);
        exit(RetiresIn);     
    end;
    //Date of death function
    procedure MemberDateOfDeath(MemberAgeCurrently: Date): Integer
    var
        AgeExpectancy: Integer;
        MemDateOfBirth: Integer;
        EstimatedY: Date;
        ExpectedY: Integer;
        Year: Integer;
        Month: Integer;
        Day: Integer;
    begin
        AgeExpectancy := 70;
        MemDateOfBirth := CalculateAge(DateOfBirth);
        EstimatedY := CalcDate(Format(AgeExpectancy) + 'Y', DateOfBirth);
        Message('Year of death estimation %1', EstimatedY);
        Year := Date2DMY(EstimatedY, 3);
        Month := Date2DMY(EstimatedY, 2);
        Day := Date2DMY(EstimatedY, 1);
        ExpectedY := Year;
        Message('Your Life Expectancy is %1', Year, Month, Day);
        exit(ExpectedY);
    end;
}