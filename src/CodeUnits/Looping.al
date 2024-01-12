codeunit 50128 Loopingthru
{
    trigger OnRun()
       var
    iteratorCount : integer;
    begin
        for iteratorCount := 1 to 10 do
        Message(Format(iteratorCount));

        for iteratorCount := 10 downto 1 do begin
        Message('Downwards count is %1', iteratorCount)
        end;
    end;
        
}