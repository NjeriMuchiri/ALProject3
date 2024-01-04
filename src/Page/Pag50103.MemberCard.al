page 50103 PageMemberCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = MembersTable;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                 field(ID;Rec.ID)
                {
                    
                }
                field(DateOfBirth; Rec.DateOfBirth)
                {
                    ApplicationArea = All;

                }
                field(Name;Rec.Name)
                {
                    
                }
                field(Age;Rec.MemAge)
                {
                    
                }
                field(RetiresIn;Rec.RetiresIn)
                {
                    
                }
                 field(DateOfDeath;Rec.DateOfDeath)
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