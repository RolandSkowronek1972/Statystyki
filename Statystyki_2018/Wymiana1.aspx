<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site1.Master" CodeBehind="Wymiana1.aspx.cs" Inherits="Statystyki_2018.Wymiana1" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
      
           <dx:ASPxPageControl ID="citiesTabPage" Width="100%" runat="server" CssClass="dxtcFixed" ActiveTabIndex="0" OnActiveTabChanged="citiesTabPage_ActiveTabChanged" >
        <TabPages>
            <dx:TabPage Text="I instancja">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl1" runat="server">
                        <table style="width: 100%;">
                            <tr>
                                <td class="wciecie" style="background-color: #CCCCCC">nr wydziału</td>
                                <td style="background-color: #CCCCCC">
                                    <dx:ASPxTextBox ID="TBNrWydzialu" runat="server" Theme="Moderno" Width="170px" required>
                                        <ValidationSettings>
                                            <RequiredField ErrorText="* Pole jest wymagane- nie może być puste" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                               
                            </tr>
                            <tr>
                                <td class="wciecie">oznaczenie repertorium</td>
                                <td>
                                    <dx:ASPxTextBox ID="TBRepertorium" runat="server" Theme="Moderno" Width="170px" required>
                                        <ValidationSettings>
                                            <RequiredField ErrorText="* Pole jest wymagane- nie może być puste" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                              
                            </tr>
                             <tr>
                                <td class="wciecie" style="background-color: #CCCCCC">numer sprawy</td>
                                <td style="background-color: #CCCCCC">
                                    <dx:ASPxTextBox ID="TBNrSprawy" runat="server" Theme="Moderno" Width="170px">
                                        <ValidationSettings>
                                            <RegularExpression ErrorText="Pole może zawierać tylko liczby całkowite większe od zera " ValidationExpression="^[1-9]\d*$" />
                                            <RequiredField ErrorText="* Pole jest wymagane- nie może być puste" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                 </td>
                              
                            </tr>
                            <tr>
                                <td class="wciecie">rok sprawy</td>
                                <td>
                                       <dx:ASPxComboBox ID="lbRok" runat="server" Theme="Moderno">
                                       </dx:ASPxComboBox>
                                </td>
                              
                            </tr>
                             <tr style="background-color: #CCCCCC">
                                <td class="wciecie">rodzaj sprawy</td>
                                <td>
                                    <dx:ASPxComboBox ID="lbRodzajSprawy" runat="server" Theme="Moderno">
                                    </dx:ASPxComboBox>
                                 </td>
                              
                            </tr>
                             <tr>
                                <td class="wciecie">
                                    <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Wyślij zapytanie" Theme="MetropolisBlue" OnClick="ASPxButton1_Click">
                                    </dx:ASPxButton>
                                 </td>
                                <td>
                                    <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Anuluj" Theme="MetropolisBlue" OnClick="AnulujInstancja1Klik">
                                    </dx:ASPxButton>
                                 </td>
                              
                            </tr>
                        </table>
                      
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="II instancja">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl2" runat="server">
                       
                        <table style="width: 100%;">
                            <tr>
                                <td class="wciecie" style="background-color: #CCCCCC">nr wydziału</td>
                                <td style="background-color: #CCCCCC">
                                    <dx:ASPxTextBox ID="TBNrWydzialu2" runat="server" required="" Theme="Moderno" Width="170px">
                                        <ValidationSettings>
                                            <RequiredField ErrorText="* Pole jest wymagane- nie może być puste" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="wciecie">oznaczenie repertorium</td>
                                <td>
                                    <dx:ASPxTextBox ID="TBRepertorium2" runat="server" required="" Theme="Moderno" Width="170px">
                                        <ValidationSettings>
                                            <RequiredField ErrorText="* Pole jest wymagane- nie może być puste" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="wciecie" style="background-color: #CCCCCC">numer sprawy</td>
                                <td style="background-color: #CCCCCC">
                                    <dx:ASPxTextBox ID="TBNrSprawy2" runat="server" Theme="Moderno" Width="170px">
                                        <ValidationSettings>
                                            <RegularExpression ErrorText="Pole może zawierać tylko liczby całkowite większe od zera " ValidationExpression="^[1-9]\d*$" />
                                            <RequiredField ErrorText="* Pole jest wymagane- nie może być puste" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="wciecie">rok sprawy</td>
                                <td>
                                    <dx:ASPxComboBox ID="lbRok2" runat="server" Theme="Moderno">
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr style="background-color: #CCCCCC">
                                <td class="wciecie">rodzaj sprawy</td>
                                <td>
                                    <dx:ASPxComboBox ID="lbRodzajSprawy2" runat="server" Theme="Moderno">
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="wciecie">
                                    <dx:ASPxButton ID="ASPxButton3" runat="server" OnClick="ASPxButton1_Click" Text="Wyślij zapytanie" Theme="MetropolisBlue">
                                    </dx:ASPxButton>
                                </td>
                                <td>
                                    <dx:ASPxButton ID="ASPxButton4" runat="server" OnClick="AnulujInstancja2Klik" Text="Anuluj" Theme="MetropolisBlue">
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                       
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
         
        </TabPages>
    </dx:ASPxPageControl>
        
        <p>
            <asp:TextBox ID="TextBox1" runat="server" Height="200px" TextMode="MultiLine" Width="1046px"></asp:TextBox>
        </p>
        <div>
        </div>
   
    </asp:Content>