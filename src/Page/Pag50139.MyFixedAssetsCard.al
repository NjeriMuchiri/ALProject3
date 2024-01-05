page 50139 FixedAssetsPageCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = BufferFixedAssetsTable;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                 field("No.";Rec."No.")
                {
                    
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = All;

                }
            }
         
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}