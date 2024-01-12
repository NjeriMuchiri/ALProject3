report 50129 FixedAssetReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;
    
    
    dataset
    {
        dataitem("Fixed Asset";"Fixed Asset")
        {
            column(No_;"No.")
            {
                
            }
             column(TheDescription;Description)
            {
                
            }
            trigger OnPreDataItem()
            begin
                if "Fixed Asset".GetFilter("No.")<>
                '' then
                Message("Fixed Asset".GetRangeMin("No."));
                Message("Fixed Asset".GetRangeMax("No."));


            end;
             trigger OnAfterGetRecord()
             begin
                if FixedAsset.find('-') then 
                begin
                repeat
                buffer.init;
                buffer."No." := FixedAsset."No.";
                buffer.Description := FixedAsset.Description;
                buffer.Insert();
                until FixedAsset.Next() = 0;
                end;
             end;            
        }    
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    // field("No."; )
                    // {
                    //     ApplicationArea = All;
                    // }
                    // field("Description"; ){}
                }
            }
        }
    
        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    
    rendering
    {
        layout(LayoutName)
        {
            Type = Excel;
            LayoutFile = 'mySpreadsheet.xlsx';
        }
    }
    
    var
        myInt: Integer;
        buffer: Record "BufferFixedAssetsTable";
        FixedAsset: Record "Fixed Asset";
}