<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="oglk3.aspx.cs" Inherits="Statystyki_2018.oglk3" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.17.0,  Culture=neutral,  PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #menu {
            position: relative;
        }

            #menu.scrolling {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
            }

        @media print {
            @page {
                size: 29cm 21.7cm;
                margin: 0mm 0mm 0mm 0mm;
            }

            div {
                transform: translate(0, 0);
                -webkit-transform: translate(0, 0 ); /* Saf3.1+, Chrome */
                -moz-transform: translate(0, 0); /* FF3.5+ */
            }
        }
    </style>
    <script src="Scripts/rls.js"></script>

    <div id="menu" class="manu_back noprint" style="height: 40px;">

        <table>
            <tr>
                <td style="width: auto; padding-left: 5px;">
                    <asp:Label ID="Label4" runat="server" Text="Proszę wybrać zakres:"></asp:Label>
                </td>
                <td style="width: auto; padding-left: 5px;">

                    <dx:ASPxDateEdit ID="Date1" runat="server" Theme="Moderno">
                    </dx:ASPxDateEdit>
                </td>
                <td style="width: auto; padding-left: 5px;">

                    <dx:ASPxDateEdit ID="Date2" runat="server" Theme="Moderno">
                    </dx:ASPxDateEdit>
                </td>
                <td style="width: auto; padding-left: 5px;">
                    <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="Odswiez">  Odśwież</asp:LinkButton>
                </td>
                <td style="width: auto; padding-left: 5px;"></td>
                <td style="width: auto; padding-left: 5px;">
                    <input id="Button1" class="ax_box" style="border-style: none; padding: 0px" type="button" onclick="JavaScript: window.print();" value="Drukuj" />
                </td>

                <td style="width: auto; padding-left: 5px;">
                    <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="tworzPlikExcell">Zapisz do Excel</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 30px;" class="content landscape">
        <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
            <asp:Label ID="LabelNazwaSadu" runat="server" Text="Sąd " Style="font-weight: 700"></asp:Label>
            <br />
        </div>

        <br />
        <div id="tabela01">
            &nbsp;<asp:Label ID="Label1" runat="server" Text="Liczba sporządzonych uzasadnień K"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel1" runat="server" Text="tabela  1" Visible="False"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela1" runat="server" OnRowCreated="naglowekTabeli_gwTabela1" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela1" Width="100%" ShowHeader="False" ShowFooter="True">
                <Columns>

                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label47" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label48" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label_gwTabela1101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label_gwTabela1102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label_gwTabela1103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                <asp:Label ID="Label_gwTabela1104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                <asp:Label ID="Label_gwTabela1105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                <asp:Label ID="Label_gwTabela1106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!7"%>')">
                                <asp:Label ID="Label_gwTabela1107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!7"%>')">
                                <asp:Label ID="Label_gwTabela1108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!7"%>')">
                                <asp:Label ID="Label_gwTabela1109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!7"%>')">
                                <asp:Label ID="Label_gwTabela1110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!7"%>')">
                                <asp:Label ID="Label_gwTabela1111" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_12" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!7"%>')">
                                <asp:Label ID="Label_gwTabela1112" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="gray" />
            </asp:GridView>

            <br />
        </div>
        <div id="tabela02" class="page-break">
            &nbsp;<asp:Label ID="Label12" runat="server" Text="Liczba sporządzonych uzasadnień W"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel2" runat="server" Text="tabela  2" Visible="False"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela2" runat="server" OnRowCreated="naglowekTabeli_gwTabela2" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela2" Width="100%" ShowHeader="False" ShowFooter="True" OnSelectedIndexChanged="gwTabela2_SelectedIndexChanged">
                <Columns>

                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label47" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label48" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label_gwTabela1101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label_gwTabela1102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label_gwTabela1103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                <asp:Label ID="Label_gwTabela1104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                <asp:Label ID="Label_gwTabela1105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                <asp:Label ID="Label_gwTabela1106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!7"%>')">
                                <asp:Label ID="Label_gwTabela1107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!7"%>')">
                                <asp:Label ID="Label_gwTabela1108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!7"%>')">
                                <asp:Label ID="Label_gwTabela1109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!7"%>')">
                                <asp:Label ID="Label_gwTabela1110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!7"%>')">
                                <asp:Label ID="Label_gwTabela1111" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_12" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!7"%>')">
                                <asp:Label ID="Label_gwTabela1112" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="gray" />
            </asp:GridView>

            <br />
        </div>
        <div>
            &nbsp;<asp:Label ID="Label14" runat="server" Text="Liczba sporządzonych uzasadnień"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel3" runat="server" Text="tabela  3" Visible="False"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela3" runat="server" OnRowCreated="naglowekTabeli_gwTabela3" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela3" Width="100%" ShowHeader="False" ShowFooter="True">
                <Columns>

                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label47" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label48" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label_gwTabela1101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label_gwTabela1102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label_gwTabela1103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                <asp:Label ID="Label_gwTabela1104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                <asp:Label ID="Label_gwTabela1105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                <asp:Label ID="Label_gwTabela1106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!7"%>')">
                                <asp:Label ID="Label_gwTabela1107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!7"%>')">
                                <asp:Label ID="Label_gwTabela1108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!7"%>')">
                                <asp:Label ID="Label_gwTabela1109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!7"%>')">
                                <asp:Label ID="Label_gwTabela1110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!7"%>')">
                                <asp:Label ID="Label_gwTabela1111" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_12" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!7"%>')">
                                <asp:Label ID="Label_gwTabela1112" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="gray" />
            </asp:GridView>

            <br />
        </div>
        <div class="page-break">
            &nbsp;<asp:Label ID="Label7" runat="server" Text="Efektywny czas orzekania"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel4" runat="server" Text="tabela 4" Visible="False"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela4" runat="server" OnRowCreated="naglowekTabeli_gwTabela4" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela4" Width="100%" ShowHeader="False" ShowFooter="True">
                <Columns>

                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label49" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label50" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label_gwTabela13115" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label_gwTabela13116" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label_gwTabela13117" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                <asp:Label ID="Label_gwTabela13118" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                <asp:Label ID="Label_gwTabela13119" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                <asp:Label ID="Label_gwTabela13120" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!7"%>')">
                                <asp:Label ID="Label_gwTabela13121" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!7"%>')">
                                <asp:Label ID="Label_gwTabela13122" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!7"%>')">
                                <asp:Label ID="Label_gwTabela13123" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!7"%>')">
                                <asp:Label ID="Label_gwTabela13124" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!7"%>')">
                                <asp:Label ID="Label_gwTabela13125" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_12" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!7"%>')">
                                <asp:Label ID="Label_gwTabela13126" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_12" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!7"%>')">
                                <asp:Label ID="Label_gwTabela13127" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="gray" />
            </asp:GridView>

            <br />

            <br />
        </div>
        <div class="page-break">
            &nbsp;<asp:Label ID="Label6" runat="server" Text="Wyznaczone i odroczone K"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel5" runat="server" Text="tabela 5" Visible="False"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela5" runat="server" OnRowCreated="naglowekTabeli_gwTabela5" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela5" Width="100%" ShowHeader="False" ShowFooter="True">
                <Columns>

                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label51" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label52" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label_gwTabela13138" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label_gwTabela13139" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label_gwTabela13140" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                <asp:Label ID="Label_gwTabela13141" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60 gray" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="gray" />
            </asp:GridView>

            <br />
        </div>
        <div class="page-break">
            &nbsp;<asp:Label ID="Label10" runat="server" Text="Wyznaczone i odrocznoe W"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="infoLabel6" runat="server" Text="tabela 6  \/\/\/" Visible="False"></asp:Label>
            &nbsp;<br />

            <asp:GridView ID="gwTabela6" runat="server" OnRowCreated="naglowekTabeli_gwTabela6" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela6" Width="100%" ShowHeader="False" ShowFooter="True">
                <Columns>

                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label53" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label54" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label_gwTabela13161" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label_gwTabela13162" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label_gwTabela13163" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                <asp:Label ID="Label_gwTabela13164" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60 gray" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="gray" />
            </asp:GridView>

            <br />
        </div>
        <div class="page-break">
            &nbsp;<asp:Label ID="Label3" runat="server">Stan referatów</asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel7" runat="server" Text="tabela 7  \/\/\/" Visible="False"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela7" runat="server" OnRowCreated="naglowekTabeli_gwTabela7" AutoGenerateColumns="False" Width="100%" ShowHeader="False" OnRowDataBound="stopkaTabeli_gwTabela7" ShowFooter="True">
                <Columns>

                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label_gwTabela2101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label_gwTabela2102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label_gwTabela2103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                <asp:Label ID="Label_gwTabela2104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                <asp:Label ID="Label_gwTabela2105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                <asp:Label ID="Label_gwTabela2106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60 gray" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="gray" />
            </asp:GridView>
            <br />
        </div>

        <div class="page-break">
            &nbsp;<asp:Label ID="Label15" runat="server">Sprawy zawieszone</asp:Label>
            &nbsp;<asp:Label ID="infoLabel8" runat="server" Text="tabela 8  \/\/\/" Visible="False"></asp:Label>
            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="borderAll col_250 center">&nbsp;</td>
                    <td class="borderAll center">Liczba spraw</td>
                    <td class="borderAll center">Terminy czynności nadzorczych
                    <br />
                        - daty kontroli z ost. 6 m-cy</td>
                </tr>
                <tr>
                    <td class="borderAll col_250 center">Zastosowanie tymczasowego aresztowania</td>
                    <td class="borderAll  center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!8!1!3')">
                            <asp:TextBox CssClass="normal center" ID="tab_8_w01_c01" runat="server" Text="0" BorderStyle="None"></asp:TextBox></a></td>
                    <td class="borderAll  center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!8!2!3')">
                            <asp:TextBox CssClass="normal center" ID="tab_8_w01_c02" runat="server" Text="0" BorderStyle="None"></asp:TextBox></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_250 center">Stan zdrowia</td>
                    <td class="borderAll  center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!8!1!3')">
                            <asp:TextBox CssClass="normal center" ID="tab_8_w02_c01" runat="server" Text="0" BorderStyle="None"></asp:TextBox></a></td>
                    <td class="borderAll  center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!8!2!3')">
                            <asp:TextBox CssClass="normal center" ID="tab_8_w02_c02" runat="server" Text="0" BorderStyle="None"></asp:TextBox></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_250 center">Inne</td>
                    <td class="borderAll  center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!8!1!3')">
                            <asp:TextBox CssClass="normal center" ID="tab_8_w03_c01" runat="server" Text="0" BorderStyle="None"></asp:TextBox></a></td>
                    <td class="borderAll  center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!8!2!3')">
                            <asp:TextBox CssClass="normal center" ID="tab_8_w03_c02" runat="server" Text="0" BorderStyle="None"></asp:TextBox></a></td>
                </tr>
                <tr>
                    <td class="borderAll center gray">Razem</td>
                    <td class="borderAll center gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!8!1!3')">
                            <asp:TextBox CssClass="normal center" ID="tab_8_w04_c01" runat="server" Text="0" BorderStyle="None" BackColor="#CCCCCC"></asp:TextBox></a></td>
                    <td class="borderAll center gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!8!2!3')">
                            <asp:TextBox CssClass="normal center" ID="tab_8_w04_c02" runat="server" Text="0" BorderStyle="None" BackColor="#CCCCCC"></asp:TextBox></a></td>
                </tr>
            </table>

            <br />
        </div>

        <div class="page-break">
            &nbsp;<asp:Label ID="Label17" runat="server">Postępowanie międzyinstancyjne w zakresie spraw K</asp:Label>
            &nbsp;<asp:Label ID="infoLabel9" runat="server" Text="tabela 9  \/\/\/" Visible="False"></asp:Label>
            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center">&nbsp;</td>
                    <td class="borderAll center" colspan="2">do 2 miesięcy</td>
                    <td class="borderAll center" colspan="2">od 2 do 3</td>
                    <td class="borderAll center" colspan="2">od 3 do 6</td>
                    <td class="borderAll center" colspan="2">od 6 do 9</td>
                    <td class="borderAll center" colspan="2">ponad 9 miesięcy</td>
                </tr>
                <tr>
                    <td class="borderAll center">ogółem</td>
                    <td class="borderAll center">ogółem</td>
                    <td class="borderAll center">%</td>
                    <td class="borderAll center">ogółem</td>
                    <td class="borderAll center">%</td>
                    <td class="borderAll center">ogółem</td>
                    <td class="borderAll center">%</td>
                    <td class="borderAll center">ogółem</td>
                    <td class="borderAll center">%</td>
                    <td class="borderAll center">ogółem</td>
                    <td class="borderAll center">%</td>
                </tr>
                <tr>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!9!1!3')">
                            <asp:Label CssClass="normal" ID="tab_9_w01_c01" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!9!2!3')">
                            <asp:Label CssClass="normal" ID="tab_9_w01_c02" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!9!3!3')">
                            <asp:Label CssClass="normal" ID="tab_9_w01_c03" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!9!4!3')">
                            <asp:Label CssClass="normal" ID="tab_9_w01_c04" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!9!5!3')">
                            <asp:Label CssClass="normal" ID="tab_9_w01_c05" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!9!6!3')">
                            <asp:Label CssClass="normal" ID="tab_9_w01_c06" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!9!7!3')">
                            <asp:Label CssClass="normal" ID="tab_9_w01_c07" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!9!8!3')">
                            <asp:Label CssClass="normal" ID="tab_9_w01_c08" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!9!9!3')">
                            <asp:Label CssClass="normal" ID="tab_9_w01_c09" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!9!10!3')">
                            <asp:Label CssClass="normal" ID="tab_9_w01_c10" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!9!11!3')">
                            <asp:Label CssClass="normal" ID="tab_9_w01_c11" runat="server" Text="0"></asp:Label></a>
                    </td>
                </tr>
            </table>

            <br />
        </div>

        <div class="page-break">
            &nbsp;<asp:Label ID="Label21" runat="server">Postępowanie międzyinstancyjne w zakresie spraw W</asp:Label>
            &nbsp;<asp:Label ID="infoLabel10" runat="server" Text="tabela 10  \/\/\/" Visible="False"></asp:Label>
            <br />

            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center">&nbsp;</td>
                    <td class="borderAll center" colspan="2">do 2 miesięcy</td>
                    <td class="borderAll center" colspan="2">od 2 do 3</td>
                    <td class="borderAll center" colspan="2">od 3 do 6</td>
                    <td class="borderAll center" colspan="2">od 6 do 9</td>
                    <td class="borderAll center" colspan="2">ponad 9 miesięcy</td>
                </tr>
                <tr>
                    <td class="borderAll center">ogółem</td>
                    <td class="borderAll center">ogółem</td>
                    <td class="borderAll center">%</td>
                    <td class="borderAll center">ogółem</td>
                    <td class="borderAll center">%</td>
                    <td class="borderAll center">ogółem</td>
                    <td class="borderAll center">%</td>
                    <td class="borderAll center">ogółem</td>
                    <td class="borderAll center">%</td>
                    <td class="borderAll center">ogółem</td>
                    <td class="borderAll center">%</td>
                </tr>
                <tr>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!10!1!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c01" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!10!2!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c02" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!10!3!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c03" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!10!4!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c04" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!10!5!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c05" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!10!6!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c06" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!10!7!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c07" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!10!8!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c08" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!10!9!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c09" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!10!10!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c10" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!10!11!3')">
                            <asp:Label CssClass="normal" ID="tab_10_w01_c11" runat="server" Text="0"></asp:Label></a>
                    </td>
                </tr>
            </table>

            <br />
        </div>

        <div class="page-break">
            &nbsp;<br />
            <asp:Label ID="Label8" runat="server">Przesłuchania</asp:Label>
            &nbsp;<asp:Label ID="infoLabel12" runat="server" Text="tabela 11  \/\/\/" Visible="False"></asp:Label>
            <br />

            <table class="dxflInternalEditorTable_MaterialCompact">
                <tr>
                    <td rowspan="2" class="borderAll center">Wpływ wniosku</td>
                    <td colspan="3" class="borderAll center">Termin przesłuchania</td>
                    <td rowspan="2" class="borderAll center">Przyczyny przedłużenia przesłuchania jeżeli przekroczono termin 7 dni od wpływu wniosku </td>
                </tr>
                <tr>
                    <td class="col_80 center borderAll">do 7 dni</td>
                    <td class="col_80 center borderAll">do 30 dni</td>
                    <td class="col_80 center borderAll">powyżej 30 dni</td>
                </tr>
                <tr>
                    <td class="col_180 center borderAll">Z art. 185 a k.p.k.</td>
                    <td class="col_80 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_12_w01_c01" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_80 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_12_w01_c02" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_80 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_12_w01_c03" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_180 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_12_w01_c04" runat="server" Text="0"></asp:Label></a>
                    </td>
                </tr>
                <tr>
                    <td class="col_180 center borderAll">Z art. 185 b k.p.k.</td>
                    <td class="col_80 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=2!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_12_w02_c01" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_80 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=2!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_12_w02_c02" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_80 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=2!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_12_w02_c03" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_180 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=2!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_12_w02_c04" runat="server" Text="0"></asp:Label></a>
                    </td>
                </tr>
                <tr>
                    <td class="col_180 center borderAll">Z art. 185 c k.p.k.</td>
                    <td class="col_80 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=3!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_12_w03_c01" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_80 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=3!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_12_w03_c02" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_80 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=3!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_12_w03_c03" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_180 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=3!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_12_w03_c04" runat="server" Text="0"></asp:Label></a>
                    </td>
                </tr>
                <tr>
                    <td class="col_180 center borderAll">Z art. 185 d k.p.k.</td>
                    <td class="col_80 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=4!11!1!3')">
                            <asp:Label CssClass="normal" ID="tab_12_w04_c01" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_80 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=4!11!2!3')">
                            <asp:Label CssClass="normal" ID="tab_12_w04_c02" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_80 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=4!11!3!3')">
                            <asp:Label CssClass="normal" ID="tab_12_w04_c03" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_180 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=4!11!4!3')">
                            <asp:Label CssClass="normal" ID="tab_12_w04_c04" runat="server" Text="0"></asp:Label></a>
                    </td>
                </tr>
            </table>

            <br />
        </div>
        <div class="page-break">
            &nbsp;<asp:Label ID="Label39" runat="server">Sprawy wyznaczone</asp:Label>
            &nbsp;<asp:Label ID="infoLabel13" runat="server" Text="tabela 12  \/\/\/" Visible="False"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela13" runat="server" OnRowCreated="naglowekTabeli_gwTabela13" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela13" Width="100%" ShowHeader="False" ShowFooter="True">
                <Columns>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label55" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label56" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label_gwTabela13174" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label_gwTabela13175" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label_gwTabela13176" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                <asp:Label ID="Label_gwTabela13177" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                <asp:Label ID="Label_gwTabela13178" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                <asp:Label ID="Label_gwTabela13179" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!7"%>')">
                                <asp:Label ID="Label_gwTabela13180" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60 gray" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="gray" />
            </asp:GridView>

            <br />
            &nbsp;Kontrola kar porządkowych
           <asp:Label ID="infoLabel14" runat="server" Text="tabela 13  \/\/\/" Visible="False"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela14" runat="server" OnRowCreated="naglowekTabeli_gwTabela14" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela14" Width="100%" ShowHeader="False" ShowFooter="True">
                <Columns>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label45" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label46" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label_gwTabela13101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label_gwTabela13102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label_gwTabela13103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                <asp:Label ID="Label_gwTabela13104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                <asp:Label ID="Label_gwTabela13105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60 gray" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="gray" />
            </asp:GridView>

            <br />
        </div>

        <div class="page-break">
            &nbsp;<asp:Label ID="Label43" runat="server">Orzeczenia II Instancji na podstawie Kontrolki uzasadnień</asp:Label>
            &nbsp;<asp:Label ID="infoLabel15" runat="server" Text="tabela 14  \/\/\/" Visible="False"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela15" runat="server" OnRowCreated="naglowekTabeli_gwTabela15" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela15" Width="100%" ShowHeader="False" ShowFooter="True" OnSelectedIndexChanged="gwTabela15_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label57" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label58" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label_gwTabela13188" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label_gwTabela13189" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label_gwTabela13190" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                <asp:Label ID="Label_gwTabela13191" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                <asp:Label ID="Label_gwTabela13192" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                <asp:Label ID="Label_gwTabela13193" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60 gray" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="gray" />
            </asp:GridView>

            <br />
        </div>

        <div id="debag">
            <br />
            <br />
            Raport statystyczny
                     <asp:Label ID="Label27" runat="server"></asp:Label>
            &nbsp;Sporzadzone dn.
            <asp:Label ID="Label29" runat="server"></asp:Label>&nbsp;przez&nbsp;
&nbsp;&nbsp;
            <asp:Label ID="Label28" runat="server"></asp:Label>
            &nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
            <br />

            <asp:Label ID="Label11" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>