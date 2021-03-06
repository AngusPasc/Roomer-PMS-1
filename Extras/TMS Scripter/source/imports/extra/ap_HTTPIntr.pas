unit ap_HTTPIntr;
{$DEFINE ENABLE_IMPORT}
{$WARN GARBAGE OFF}
{$WARN SYMBOL_PLATFORM OFF}
{$WARN UNIT_PLATFORM OFF}
{$WARN UNIT_DEPRECATED OFF}
{$IFDEF ENABLE_IMPORT}
  {$IFDEF VER150}
    interface implementation end.
  {$ELSE}
    {$IF CompilerVersion >= 24}
      {$LEGACYIFEND ON}
    {$IFEND}

    {$IF CompilerVersion >= 28}
      interface implementation end.
    {$ELSEIF CompilerVersion >= 27}
      interface implementation end.
    {$ELSEIF CompilerVersion >= 26}
      interface implementation end.
    {$ELSEIF CompilerVersion >= 25}
      interface implementation end.
    {$ELSEIF CompilerVersion >= 24}
      interface implementation end.
    {$ELSEIF CompilerVersion >= 23}
      interface implementation end.
    {$ELSEIF CompilerVersion >= 22}
      {$I ..\..\..\imports\delphi2011\ap_HTTPIntr.pas}
    {$ELSEIF CompilerVersion >= 21}
      {$I ..\..\..\imports\delphi2010\ap_HTTPIntr.pas}
    {$ELSEIF CompilerVersion >= 20}
      {$I ..\..\..\imports\delphi2009\ap_HTTPIntr.pas}
    {$ELSEIF CompilerVersion >= 18.5}
      {$I ..\..\..\imports\delphi2007\ap_HTTPIntr.pas}
    {$IFEND}
  {$ENDIF}
{$ELSE}
  interface implementation end.
{$ENDIF}
