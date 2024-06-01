classdef curlSelected < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        CurlUIFigure      matlab.ui.Figure
        zCalculateLabel   matlab.ui.control.Label
        yCalculateLabel   matlab.ui.control.Label
        xCalculateLabel   matlab.ui.control.Label
        zLabel            matlab.ui.control.Label
        yLabel            matlab.ui.control.Label
        xLabel            matlab.ui.control.Label
        xEditField        matlab.ui.control.EditField
        xEditFieldLabel   matlab.ui.control.Label
        zEditField        matlab.ui.control.EditField
        EditField_2Label  matlab.ui.control.Label
        yEditField        matlab.ui.control.EditField
        Label             matlab.ui.control.Label
        CalculateButton   matlab.ui.control.Button
        VectorLabel       matlab.ui.control.Label
    end

    
    properties (Access = private)
        AppCaller % Main App
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
            if app.xEditField.Value == ""
                app.xEditField.Value = "0";
            end
            if app.yEditField.Value == ""
                app.yEditField.Value = "0";
            end
            if app.zEditField.Value == ""
                app.zEditField.Value = "0";
            end

            Vx = str2sym(app.xEditField.Value);
            Vy = str2sym(app.yEditField.Value);
            Vz = str2sym(app.zEditField.Value);

            Ax = diff(Vz,y) - diff(Vy,z);
            Ay = diff(Vx,z) - diff(Vz,x);
            Az = diff(Vy,x) - diff(Vx,y);

            app.xCalculateLabel.Text = string(Ax);
            app.yCalculateLabel.Text = string(Ay);
            app.zCalculateLabel.Text = string(Az);

        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Get the file path for locating images
            pathToMLAPP = fileparts(mfilename('fullpath'));

            % Create CurlUIFigure and hide until all components are created
            app.CurlUIFigure = uifigure('Visible', 'off');
            app.CurlUIFigure.Color = [1 1 1];
            app.CurlUIFigure.Position = [100 100 640 524];
            app.CurlUIFigure.Name = 'Curl';
            app.CurlUIFigure.Icon = fullfile(pathToMLAPP, 'Logo2.png');

            % Create VectorLabel
            app.VectorLabel = uilabel(app.CurlUIFigure);
            app.VectorLabel.FontSize = 24;
            app.VectorLabel.FontWeight = 'bold';
            app.VectorLabel.Position = [58 449 87 31];
            app.VectorLabel.Text = 'Vector:';

            % Create CalculateButton
            app.CalculateButton = uibutton(app.CurlUIFigure, 'push');
            app.CalculateButton.ButtonPushedFcn = createCallbackFcn(app, @CalculateButtonPushed, true);
            app.CalculateButton.FontSize = 24;
            app.CalculateButton.FontWeight = 'bold';
            app.CalculateButton.Position = [118 186 122 38];
            app.CalculateButton.Text = 'Calculate';

            % Create Label
            app.Label = uilabel(app.CurlUIFigure);
            app.Label.HorizontalAlignment = 'right';
            app.Label.FontSize = 24;
            app.Label.FontWeight = 'bold';
            app.Label.Position = [70 318 33 31];
            app.Label.Text = 'ŷ: ';

            % Create yEditField
            app.yEditField = uieditfield(app.CurlUIFigure, 'text');
            app.yEditField.Position = [118 318 435 31];

            % Create EditField_2Label
            app.EditField_2Label = uilabel(app.CurlUIFigure);
            app.EditField_2Label.HorizontalAlignment = 'right';
            app.EditField_2Label.FontSize = 24;
            app.EditField_2Label.FontWeight = 'bold';
            app.EditField_2Label.Position = [70 256 25 31];
            app.EditField_2Label.Text = 'ẑ:';

            % Create zEditField
            app.zEditField = uieditfield(app.CurlUIFigure, 'text');
            app.zEditField.Position = [118 256 434 31];

            % Create xEditFieldLabel
            app.xEditFieldLabel = uilabel(app.CurlUIFigure);
            app.xEditFieldLabel.HorizontalAlignment = 'right';
            app.xEditFieldLabel.FontSize = 24;
            app.xEditFieldLabel.FontWeight = 'bold';
            app.xEditFieldLabel.Position = [70 382 27 31];
            app.xEditFieldLabel.Text = 'x̂:';

            % Create xEditField
            app.xEditField = uieditfield(app.CurlUIFigure, 'text');
            app.xEditField.Position = [118 382 436 31];

            % Create xLabel
            app.xLabel = uilabel(app.CurlUIFigure);
            app.xLabel.FontSize = 24;
            app.xLabel.FontWeight = 'bold';
            app.xLabel.Position = [73 131 27 31];
            app.xLabel.Text = 'x̂:';

            % Create yLabel
            app.yLabel = uilabel(app.CurlUIFigure);
            app.yLabel.FontSize = 24;
            app.yLabel.FontWeight = 'bold';
            app.yLabel.Position = [70 81 33 31];
            app.yLabel.Text = 'ŷ: ';

            % Create zLabel
            app.zLabel = uilabel(app.CurlUIFigure);
            app.zLabel.FontSize = 24;
            app.zLabel.FontWeight = 'bold';
            app.zLabel.Position = [70 34 25 31];
            app.zLabel.Text = 'ẑ:';

            % Create xCalculateLabel
            app.xCalculateLabel = uilabel(app.CurlUIFigure);
            app.xCalculateLabel.FontSize = 24;
            app.xCalculateLabel.FontWeight = 'bold';
            app.xCalculateLabel.Position = [102 131 462 31];
            app.xCalculateLabel.Text = '0';

            % Create yCalculateLabel
            app.yCalculateLabel = uilabel(app.CurlUIFigure);
            app.yCalculateLabel.FontSize = 24;
            app.yCalculateLabel.FontWeight = 'bold';
            app.yCalculateLabel.Position = [102 81 462 31];
            app.yCalculateLabel.Text = '0';

            % Create zCalculateLabel
            app.zCalculateLabel = uilabel(app.CurlUIFigure);
            app.zCalculateLabel.FontSize = 24;
            app.zCalculateLabel.FontWeight = 'bold';
            app.zCalculateLabel.Position = [102 34 462 31];
            app.zCalculateLabel.Text = '0';

            % Show the figure after all components are created
            app.CurlUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = curlSelected(varargin)

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.CurlUIFigure)

            % Execute the startup function
            runStartupFcn(app, @(app)startupFcn(app, varargin{:}))

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.CurlUIFigure)
        end
    end
end