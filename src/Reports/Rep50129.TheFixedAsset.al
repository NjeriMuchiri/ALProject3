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
             trigger OnAfterGetRecord()
             var
                myInt: Integer;
             begin
                
                buffer.init;
                buffer."No." := "Fixed Asset"."No.";
                buffer.Description := "Fixed Asset".Description;
                buffer.Insert();
 
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
}