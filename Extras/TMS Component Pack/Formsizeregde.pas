{***************************************************************************}
{ TFormSize component                                                       }
{ for Delphi & C++Builder                                                   }
{                                                                           }
{ written by TMS Software                                                   }
{            copyright � 2016                                               }
{            Email : info@tmssoftware.com                                   }
{            Web : http://www.tmssoftware.com                               }
{                                                                           }
{ The source code is given as is. The author is not responsible             }
{ for any possible damage done due to the use of this code.                 }
{ The component can be freely used in any application. The complete         }
{ source code remains property of the author and may not be distributed,    }
{ published, given or sold in any form as such. No parts of the source      }
{ code can be included in any other component or application without        }
{ written authorization of the author.                                      }
{***************************************************************************}
unit formsizeregde;

interface

uses
  Classes, FormSizeDe, DesignIntf, DesignEditors, FormSize;

procedure Register;

implementation

procedure Register;
begin
  RegisterPropertyEditor(TypeInfo(string), TDataBinding, 'FieldFormName', TFormSizeDataFieldProperty);
  RegisterPropertyEditor(TypeInfo(string), TDataBinding, 'FieldMachine', TFormSizeDataFieldProperty);
  RegisterPropertyEditor(TypeInfo(string), TDataBinding, 'FieldPosX', TFormSizeDataFieldProperty);
  RegisterPropertyEditor(TypeInfo(string), TDataBinding, 'FieldPosY', TFormSizeDataFieldProperty);
  RegisterPropertyEditor(TypeInfo(string), TDataBinding, 'FieldSizeWidth', TFormSizeDataFieldProperty);
  RegisterPropertyEditor(TypeInfo(string), TDataBinding, 'FieldSizeHeight', TFormSizeDataFieldProperty);
  RegisterPropertyEditor(TypeInfo(string), TDataBinding, 'FieldUser', TFormSizeDataFieldProperty);
  RegisterPropertyEditor(TypeInfo(string), TDataBinding, 'FieldWindowState', TFormSizeDataFieldProperty);
end;

end.
