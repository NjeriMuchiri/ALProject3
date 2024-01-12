page 50135 FixedAssetsPageList
{
    ApplicationArea = All;
    CardPageId = FixedAssetsPageCard;
    Caption = 'FixedAssetsM';
    PageType = List;
    SourceTable = BufferFixedAssetsTable;
    UsageCategory = Lists;
    
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No"; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Description;Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
            
        }
    }
    actions
    {
        area(Processing)
        {
            action(buffering)
            {
                ApplicationArea = All;

                trigger OnAction();
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
            action(Assetssranges)
            {
                ApplicationArea = All;
                
                trigger OnAction()                   
                begin
                   buffer.Reset();

                end;
            }
            action(AssetssFilter)
            {
                ApplicationArea = All;
                
                trigger OnAction()
                begin
                    Rec.SetFilter("No.", 'FA000010..FA000050');
                end;
            }
        }
    }
     var
        myInt: Integer;
        buffer: Record "BufferFixedAssetsTable";
        FixedAsset: Record "Fixed Asset";
}
