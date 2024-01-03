page 50103 PageName
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = MyTable;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(DateOfBirth; Rec.DateOfBirth)
                {
                    ApplicationArea = All;

                }
                field(Name;Rec.Name)
                {
                    
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