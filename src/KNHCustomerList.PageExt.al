/// <summary>
/// PageExtension KNH Customer List (ID 50500) extends Record Customer List.
/// </summary>
pageextension 50500 "KNHCustomerList" extends "Customer List"
{

    layout
    {
        // Add changes to page layout here
        addafter("Search Name")
        {
            field("Mobile Phone No."; Rec."Mobile Phone No.")
            {
                ApplicationArea = All;
                ToolTip = 'Mobile Phone No.';

                trigger OnAssistEdit()
                begin
                    DateLookup.Run();
                end;
            }
        }

    }

    var
        DateTimeDialog: Page "Date-Time Dialog";
        DateLookup: Page "Date Lookup";

    trigger OnOpenPage()
    begin
        DateTimeDialog.Caption('When does your vacation start?');
        DateTimeDialog.SetDateTime(CurrentDateTime);
        if DateTimeDialog.RunModal() = Action::OK then
            Message('You selected %1', DateTimeDialog.GetDateTime());
    end;
}
