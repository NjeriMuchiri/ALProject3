codeunit 50103 AgeCalculation
{
    procedure CalculateAge(DateOfBirth: Date): Integer
    var
        Today: Date;
        AgeInDays: Integer;
        AgeInYears: Decimal;
        Age: Integer;
        Direction: text;
    begin
        AgeInDays := Today - DateOfBirth;
        AgeInYears:=AgeInDays/365;
        Direction:= '<';
        Age:=Round(AgeInYears,1,Direction);
        Message('Your age is %1 years old',Age);
       // exit(Age);
    end;
    // trigger OnRun()
    // var
    //     DateOfBirth: Date;
    //     Age: Integer;
    // begin
    //     DateOfBirth := 1990, 5, 15;

    //     DateOfBirth := CalculateAge(DateOfBirth);

    //     // Display the result (you might want to output this to a report or log)
    //     MESSAGE('Member Age: %1',Age);
    // end;
}

