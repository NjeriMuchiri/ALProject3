pageextension 50115 CustomerList extends "Customer List"
{
    
    actions
    {
        // Add changes to page actions here
        addafter("Sent Emails")
        {
            action(ImportMultipleUsersPictures)
            {
                Caption = 'Import Multiple Users Pictures';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Import;
                ToolTip = 'Import Multiple Users Pictures';
                
                trigger OnAction()
                begin
                    ImportMultipleUsersPicturesFromZip();
                end;
            }
        }
    }
    
    local procedure ImportMultipleUsersPicturesFromZip()
    var
       FileMgt: Codeunit "File Management";
       DataCompression: Codeunit "Data Compression";
       TempBlob: Codeunit "Temp Blob";
       EntryList: List of [Text];
       EntryListKey: Text;
       ZipFileName: Text;
       FileName: Text;
       FileExtension: Text;
       InStream: InStream;
       EntryOutStream: OutStream;
       EntryInStream: InStream;
       Length: Integer;
       SelectZipFileMsg: Label 'Select ZIP File';
       FileCount: Integer;
       cust: Record Customer;
       NoCustError: Label 'Customer %1 does not exist';
       ImportedMsg: Label '%1 pictures imported successfully';
    begin
        //upload the zip file
        if not UploadIntoStream(SelectZipFileMsg, '', 'Zip Files|*.zip', ZipFileName, InStream) then
             Error('');

        //Extract zip File and store 
        DataCompression.OpenZipArchive(Instream, false);
        DataCompression.GetEntryList(EntryList);

        FileCount := 0;

        //Loop Files From List type
        foreach EntryListKey in EntryList do begin
            FileName := CopyStr(FileMgt.GetFileNameWithoutExtension(EntryListKey), 1, MaxStrLen(FileName));
            FileExtension := CopyStr(FileMgt.GetExtension(EntryListKey), 1, MaxStrLen(FileExtension));
            TempBlob.CreateOutStream(EntryOutStream);
            DataCompression.ExtractEntry(EntryListKey, EntryOutStream, Length);
            TempBlob.CreateInStream(EntryInStream);

            //Import each file where you want
            if not cust.Get(FileName) then
                 Error(NoCustError, FileName);
            clear(Cust.Image);
            cust.Image.ImportStream(EntryInStream, FileName);
            cust.Modify(true);
            FileCount += 1;
        end;
        //Close the zip file
        DataCompression.CloseZipArchive();
        if FileCount > 0 then
            Message(ImportedMsg, FileCount);
    end;
}