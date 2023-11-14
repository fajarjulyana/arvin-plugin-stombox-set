object DataModuleVST: TDataModuleVST
  OldCreateOrder = False
  Left = 192
  Top = 127
  Height = 149
  Width = 215
  object VSTHOST: TVstHost
    VstPlugIns = <
      item
        DisplayName = 'TVstPlugIn'
        DLLFileName = 'l'
      end
      item
        DisplayName = 'TVstPlugIn'
      end
      item
        DisplayName = 'TVstPlugIn'
      end
      item
        DisplayName = 'TVstPlugIn'
      end>
    ParameterQuantization = 0
    CanDos = [hcdSendVstEvents, hcdSendVstMidiEvent, hcdSendVstTimeInfo, hcdReceiveVstEvents, hcdReceiveVstMidiEvent, hcdReceiveVstTimeInfo, hcdReportConnectionChanges, hcdAcceptIOChanges, hcdSizeWindow, hcdAsyncProcessing, hcdOffline, hcdSupplyIdle, hcdStartStopProcess]
    ManageIdleAutomaticly = False
    Tempo = 120.000000000000000000
    VstVersion = 2300
    VendorVersion = 0
    PlugInDir = 'D:\Program Files\Borland\Delphi7\Bin'
    VstTimeInfo.SampleRate = 44100.000000000000000000
    VstTimeInfo.Tempo = 120.000000000000000000
    VstTimeInfo.Flags = [vtiNanosValid, vtiPpqPosValid, vtiTempoValid, vtiBarsValid, vtiCyclePosValid, vtiTimeSigValid, vtiSmpteValid, vtiClockValid]
    Left = 8
    Top = 8
  end
  object ASIOHost1: TASIOHost
    CanDos = []
    ConvertOptimizations = [coSSE, co3DNow]
    SelectorSupport = [assEngineVersion, assResetRequest, assBufferSizeChange, assResyncRequest, assLatenciesChanged]
    SampleRate = 44100.000000000000000000
    ASIOTime.Speed = 1.000000000000000000
    ASIOTime.SampleRate = 44100.000000000000000000
    ASIOTime.Flags = [atSystemTimeValid, atSamplePositionValid, atSampleRateValid, atSpeedValid, atSampleRateChanged, atClockSourceChanged]
    Left = 49
    Top = 8
  end
  object OD: TOpenDialog
    DefaultExt = 'DLL'
    Filter = 'VST Plugin (*.dll)|*.dll'
    Title = 'Load VST Plugin'
    Left = 92
    Top = 9
  end
  object OD1: TOpenDialog
    DefaultExt = 'DLL'
    Filter = 'VST Plugin (*.dll)|*.dll'
    Title = 'Load VST Plugin'
    Left = 132
    Top = 9
  end
end
