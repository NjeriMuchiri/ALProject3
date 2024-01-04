page 50145 MemerPageList
{
    ApplicationArea = All;
    CardPageId = PageMemberCard;
    Caption = 'MemerPageList';
    PageType = List;
    SourceTable = MembersTable;
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(DateOfBirth; Rec.DateOfBirth)
                {
                    ToolTip = 'Specifies the value of the DateOfBirth field.';
                }
                field(ID; Rec.ID)
                {
                    ToolTip = 'Specifies the value of the ID field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                 field(Age; Rec.Age)
                {
                    ToolTip = 'Specifies the value of the Age field.';
                }
                  field(RetiresIn; Rec.RetiresIn)
                {
                    ToolTip = 'Specifies the value of the RetiresIn field.';
                }
            }
        }
    }
}
