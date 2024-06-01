classdef gradientSelected < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        GradientUIFigure  matlab.ui.Figure
        zLabel            matlab.ui.control.Label
        yLabel            matlab.ui.control.Label
        xLabel            matlab.ui.control.Label
        xHat              matlab.ui.control.Label
        yHat              matlab.ui.control.Label
        zHat              matlab.ui.control.Label
        CalculateButton   matlab.ui.control.Button
        EditField         matlab.ui.control.EditField
        SurfaceLabel      matlab.ui.control.Label
    end

    
    properties (Access = private)
        AppCaller % Description
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app, caller)
            app.AppCaller = caller;
        end

        % Button pushed function: CalculateButton
        function CalculateButtonPushed(app, event)
            syms x y z
            %f = app.EditField.Value;
            f = str2sym(app.EditField.Value);
            v = [x y z];
            g = gradient(f,v);
            app.xLabel.Text = string(g(1));
            app.yLabel.Text = string(g(2));
            app.zLabel.Text = string(g(3));
        end

        % Value changed function: EditField
        function EditFieldValueChanged(app, event)
          
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Get the file path for locating images
            pathToMLAPP = fileparts(mfilename('fullpath'));

            % Create GradientUIFigure and hide until all components are created
            app.GradientUIFigure = uifigure('Visible', 'off');
            app.GradientUIFigure.Color = [1 1 1];
            app.GradientUIFigure.Position = [100 100 541 446];
            app.GradientUIFigure.Name = 'Gradient';
            app.GradientUIFigure.Icon = fullfile(pathToMLAPP, 'Logo2.png');

            % Create SurfaceLabel
            app.SurfaceLabel = uilabel(app.GradientUIFigure);
            app.SurfaceLabel.FontSize = 24;
            app.SurfaceLabel.FontWeight = 'bold';
            app.SurfaceLabel.Position = [45 373 101 31];
            app.SurfaceLabel.Text = 'Surface:';

            % Create EditField
            app.EditField = uieditfield(app.GradientUIFigure, 'text');
            app.EditField.ValueChangedFcn = createCallbackFcn(app, @EditFieldValueChanged, true);
            app.EditField.FontSize = 24;
            app.EditField.Position = [45 288 446 52];

            % Create CalculateButton
            app.CalculateButton = uibutton(app.GradientUIFigure, 'push');
            app.CalculateButton.ButtonPushedFcn = createCallbackFcn(app, @CalculateButtonPushed, true);
            app.CalculateButton.FontSize = 24;
            app.CalculateButton.FontWeight = 'bold';
            app.CalculateButton.Position = [45 187 447 54];
            app.CalculateButton.Text = 'Calculate';

            % Create zHat
            app.zHat = uilabel(app.GradientUIFigure);
            app.zHat.FontSize = 24;
            app.zHat.FontWeight = 'bold';
            app.zHat.Position = [46 40 25 31];
            app.zHat.Text = 'ẑ:';

            % Create yHat
            app.yHat = uilabel(app.GradientUIFigure);
            app.yHat.FontSize = 24;
            app.yHat.FontWeight = 'bold';
            app.yHat.Position = [46 86 33 31];
            app.yHat.Text = 'ŷ: ';

            % Create xHat
            app.xHat = uilabel(app.GradientUIFigure);
            app.xHat.FontSize = 24;
            app.xHat.FontWeight = 'bold';
            app.xHat.Position = [46 135 27 31];
            app.xHat.Text = 'x̂:';

            % Create xLabel
            app.xLabel = uilabel(app.GradientUIFigure);
            app.xLabel.WordWrap = 'on';
            app.xLabel.FontSize = 24;
            app.xLabel.FontWeight = 'bold';
            app.xLabel.Position = [86 135 405 31];
            app.xLabel.Text = '0';

            % Create yLabel
            app.yLabel = uilabel(app.GradientUIFigure);
            app.yLabel.WordWrap = 'on';
            app.yLabel.FontSize = 24;
            app.yLabel.FontWeight = 'bold';
            app.yLabel.Position = [86 86 406 31];
            app.yLabel.Text = '0';

            % Create zLabel
            app.zLabel = uilabel(app.GradientUIFigure);
            app.zLabel.WordWrap = 'on';
            app.zLabel.FontSize = 24;
            app.zLabel.FontWeight = 'bold';
            app.zLabel.Position = [86 40 405 31];
            app.zLabel.Text = '0';

            % Show the figure after all components are created
            app.GradientUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = gradientSelected(varargin)

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.GradientUIFigure)

            % Execute the startup function
            runStartupFcn(app, @(app)startupFcn(app, varargin{:}))

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.GradientUIFigure)
        end
    end
end