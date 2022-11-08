<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="redirector2.aspx.cs" Inherits="Statystyki_2018.redirector2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="text-align:center;">
    <br />
    <p style="font-size: x-large; font-weight: bold">
        Proszę wybrać dział z listy rozwijanej...</p>
    </div>
<div style="text-align:center;">
    <p style="font-size: x-large; font-weight: bold">
        &nbsp;</p>
    </div>
<div style="text-align:center;">
    <p style="font-size: x-large; font-weight: bold">
        </p>
    <asp:Panel ID="Panel1" runat="server" style="text-align: left" Visible="False">
        <div class="dxeICC">
            <br />
            dane uzytkownika</div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="daneUzytkownika" GridLines="Horizontal" Width="100%">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="Identyfikator" HeaderText="Identyfikator" InsertVisible="False" ReadOnly="True" SortExpression="Identyfikator" />
                <asp:BoundField DataField="imie" HeaderText="imie" SortExpression="imie" />
                <asp:BoundField DataField="nazwisko" HeaderText="nazwisko" SortExpression="nazwisko" />
                <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" />
                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                <asp:BoundField DataField="login_domenowy" HeaderText="login_domenowy" SortExpression="login_domenowy" />
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
        kontrolki w manu miesięczne dla uzykownika<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="uprawnienia" ForeColor="Black" GridLines="None" Width="100%">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="id_wydzialu" HeaderText="id_wydzialu" SortExpression="id_wydzialu" />
                <asp:BoundField DataField="nazwa" HeaderText="nazwa" SortExpression="nazwa" />
                <asp:BoundField DataField="cs" HeaderText="cs" SortExpression="cs" />
                <asp:BoundField DataField="debug" HeaderText="debug" SortExpression="debug" />
                <asp:BoundField DataField="sad" HeaderText="sad" SortExpression="sad" />
                <asp:BoundField DataField="plik" HeaderText="plik" SortExpression="plik" />
                <asp:BoundField DataField="licencja" HeaderText="licencja" SortExpression="licencja" />
                <asp:BoundField DataField="id_uzytkownika" HeaderText="id_uzytkownika" SortExpression="id_uzytkownika" />
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <br />
        Kontrolki w manu kontrolki dla uzytkownika<asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="1" DataSourceID="manuKotrolkiUzytkownika" ForeColor="Black" GridLines="Vertical" Width="100%">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="ident" HeaderText="ident" InsertVisible="False" ReadOnly="True" SortExpression="ident" />
                <asp:BoundField DataField="opis" HeaderText="opis" SortExpression="opis" />
                <asp:BoundField DataField="wartosc" HeaderText="wartosc" SortExpression="wartosc" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="manuKotrolkiUzytkownika" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT konfig.ident, konfig.opis, konfig.wartosc FROM konfig RIGHT OUTER JOIN uprawnienia ON konfig.ident + 100 = uprawnienia.id_wydzialu WHERE (konfig.klucz = RTRIM('kontrolka'))"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView4" runat="server">
        </asp:GridView>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </asp:Panel>
    <asp:SqlDataSource ID="daneUzytkownika" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT ident AS Identyfikator, imie, nazwisko, login, password, login_domenowy FROM uzytkownik WHERE (ident = @ident)">
        <SelectParameters>
            <asp:SessionParameter Name="ident" SessionField="identyfikatorUzytkownika" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    </div>
<asp:SqlDataSource ID="uprawnienia" runat="server" ConnectionString="<%$ ConnectionStrings:wap %>" SelectCommand="SELECT uprawnienia.id_wydzialu, wydzialy.nazwa, wydzialy.cs, wydzialy.debug, wydzialy.sad, wydzialy.plik, wydzialy.licencja, uprawnienia.id_uzytkownika FROM uprawnienia LEFT OUTER JOIN wydzialy ON uprawnienia.id_wydzialu = wydzialy.ident WHERE (uprawnienia.id_uzytkownika = @ident)">
    <SelectParameters>
        <asp:SessionParameter Name="ident" SessionField="identyfikatorUzytkownika" />
    </SelectParameters>
</asp:SqlDataSource>
<div style="text-align:center;">
    <p style="font-size: x-large; font-weight: bold">
        &nbsp;</p>
    </div>
<div style="text-align:center;">
    <p style="font-size: x-large; font-weight: bold">
        &nbsp;</p>
    </div>

</asp:Content>
