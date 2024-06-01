classdef infoSelected < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        InformationUIFigure      matlab.ui.Figure
        GhazalSaboorMalekiLabel  matlab.ui.control.Label
        MobinaMasoumiLabel       matlab.ui.control.Label
        AmirAliBagheralLabel     matlab.ui.control.Label
        MostafaCharkaziLabel     matlab.ui.control.Label
    end

    
    properties (Access = private)
        CallingApp % Main App
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app, caller)
            app.CallingApp = caller;
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create InformationUIFigure and hide until all components are created
            app.InformationUIFigure = uifigure('Visible', 'off');
            app.InformationUIFigure.Color = [1 1 1];
            app.InformationUIFigure.Position = [100 100 378 266];
            app.InformationUIFigure.Name = 'Information';
            app.InformationUIFigure.Icon = 'Logo2.png';
            app.InformationUIFigure.Resize = 'off';

            % Create MostafaCharkaziLabel
            app.MostafaCharkaziLabel = uilabel(app.InformationUIFigure);
            app.MostafaCharkaziLabel.FontSize = 24;
            app.MostafaCharkaziLabel.FontWeight = 'bold';
            app.MostafaCharkaziLabel.Position = [43 201 204 31];
            app.MostafaCharkaziLabel.Text = 'Mostafa Charkazi';

            % Create AmirAliBagheralLabel
            app.AmirAliBagheralLabel = uilabel(app.InformationUIFigure);
            app.AmirAliBagheralLabel.FontSize = 24;
            app.AmirAliBagheralLabel.FontWeight = 'bold';
            app.AmirAliBagheralLabel.Position = [43 147 207 31];
            app.AmirAliBagheralLabel.Text = 'Amir Ali Bagheral';

            % Create MobinaMasoumiLabel
            app.MobinaMasoumiLabel = uilabel(app.InformationUIFigure);
            app.MobinaMasoumiLabel.FontSize = 24;
            app.MobinaMasoumiLabel.FontWeight = 'bold';
            app.MobinaMasoumiLabel.Position = [43 94 200 31];
            app.MobinaMasoumiLabel.Text = 'Mobina Masoumi';

            % Create GhazalSaboorMalekiLabel
            app.GhazalSaboorMalekiLabel = uilabel(app.InformationUIFigure);
            app.GhazalSaboorMalekiLabel.FontSize = 24;
            app.GhazalSaboorMalekiLabel.FontWeight = 'bold';
            app.GhazalSaboorMalekiLabel.Position = [43 40 255 31];
            app.GhazalSaboorMalekiLabel.Text = 'Ghazal Saboor Maleki';

            % Show the figure after all components are created
            app.InformationUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = infoSelected(varargin)

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.InformationUIFigure)

            % Execute the startup function
            runStartupFcn(app, @(app)startupFcn(app, varargin{:}))

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.InformationUIFigure)
        end
    end
end