classdef divergenceSelected < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        DivergenceUIFigure  matlab.ui.Figure
        CalculationLabel    matlab.ui.control.Label
        CalculateButton     matlab.ui.control.Button
        xEditField          matlab.ui.control.EditField
        xEditFieldLabel     matlab.ui.control.Label
        zEditField          matlab.ui.control.EditField
        EditField_2Label    matlab.ui.control.Label
        yEditField          matlab.ui.control.EditField
        Label               matlab.ui.control.Label
        VectorLabel         matlab.ui.control.Label
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
            
            Dx=diff(Vx,x);
            Dy=diff(Vy,y);
            Dz=diff(Vz,z);

            D = Dx + Dy + Dz;

            app.CalculationLabel.Text = string(D);

        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Get the file path for locating images
            pathToMLAPP = fileparts(mfilename('fullpath'));

            % Create DivergenceUIFigure and hide until all components are created
            app.DivergenceUIFigure = uifigure('Visible', 'off');
            app.DivergenceUIFigure.Color = [1 1 1];
            app.DivergenceUIFigure.Position = [100 100 640 480];
            app.DivergenceUIFigure.Name = 'Divergence';
            app.DivergenceUIFigure.Icon = fullfile(pathToMLAPP, 'Logo2.png');

            % Create VectorLabel
            app.VectorLabel = uilabel(app.DivergenceUIFigure);
            app.VectorLabel.FontSize = 24;
            app.VectorLabel.FontWeight = 'bold';
            app.VectorLabel.Position = [58 405 87 31];
            app.VectorLabel.Text = 'Vector:';

            % Create Label
            app.Label = uilabel(app.DivergenceUIFigure);
            app.Label.HorizontalAlignment = 'right';
            app.Label.FontSize = 24;
            app.Label.FontWeight = 'bold';
            app.Label.Position = [70 274 33 31];
            app.Label.Text = 'ŷ: ';

            % Create yEditField
            app.yEditField = uieditfield(app.DivergenceUIFigure, 'text');
            app.yEditField.Position = [118 274 435 31];

            % Create EditField_2Label
            app.EditField_2Label = uilabel(app.DivergenceUIFigure);
            app.EditField_2Label.HorizontalAlignment = 'right';
            app.EditField_2Label.FontSize = 24;
            app.EditField_2Label.FontWeight = 'bold';
            app.EditField_2Label.Position = [70 212 25 31];
            app.EditField_2Label.Text = 'ẑ:';

            % Create zEditField
            app.zEditField = uieditfield(app.DivergenceUIFigure, 'text');
            app.zEditField.Position = [118 212 434 31];

            % Create xEditFieldLabel
            app.xEditFieldLabel = uilabel(app.DivergenceUIFigure);
            app.xEditFieldLabel.HorizontalAlignment = 'right';
            app.xEditFieldLabel.FontSize = 24;
            app.xEditFieldLabel.FontWeight = 'bold';
            app.xEditFieldLabel.Position = [70 338 27 31];
            app.xEditFieldLabel.Text = 'x̂:';

            % Create xEditField
            app.xEditField = uieditfield(app.DivergenceUIFigure, 'text');
            app.xEditField.Position = [118 338 436 31];

            % Create CalculateButton
            app.CalculateButton = uibutton(app.DivergenceUIFigure, 'push');
            app.CalculateButton.ButtonPushedFcn = createCallbackFcn(app, @CalculateButtonPushed, true);
            app.CalculateButton.FontSize = 24;
            app.CalculateButton.FontWeight = 'bold';
            app.CalculateButton.Position = [118 142 122 38];
            app.CalculateButton.Text = 'Calculate';

            % Create CalculationLabel
            app.CalculationLabel = uilabel(app.DivergenceUIFigure);
            app.CalculationLabel.HorizontalAlignment = 'center';
            app.CalculationLabel.FontSize = 24;
            app.CalculationLabel.FontWeight = 'bold';
            app.CalculationLabel.Position = [48 78 540 31];
            app.CalculationLabel.Text = '';

            % Show the figure after all components are created
            app.DivergenceUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = divergenceSelected(varargin)

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.DivergenceUIFigure)

            % Execute the startup function
            runStartupFcn(app, @(app)startupFcn(app, varargin{:}))

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.DivergenceUIFigure)
        end
    end
end