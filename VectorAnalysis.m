classdef VectorAnalysis < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        VectorAnalysisUIFigure  matlab.ui.Figure
        Menu                    matlab.ui.container.Menu
        InfoMenu                matlab.ui.container.Menu
        CurlButton              matlab.ui.control.Button
        DivergenceButton        matlab.ui.control.Button
        GradientButton          matlab.ui.control.Button
        Image                   matlab.ui.control.Image
    end

    
    properties (Access = private)
        InfoApp % Info App
        Gradient % Gradient App
        Divergence % Divergence App
        Curl % Curl App
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Menu selected function: InfoMenu
        function InfoMenuSelected(app, event)
            app.InfoApp = infoSelected(app);
        end

        % Button pushed function: GradientButton
        function GradientButtonPushed(app, event)
            app.Gradient = gradientSelected(app);
        end

        % Button pushed function: DivergenceButton
        function DivergenceButtonPushed(app, event)
            app.Divergence = divergenceSelected(app);
        end

        % Button pushed function: CurlButton
        function CurlButtonPushed(app, event)
            app.Curl = curlSelected(app);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Get the file path for locating images
            pathToMLAPP = fileparts(mfilename('fullpath'));

            % Create VectorAnalysisUIFigure and hide until all components are created
            app.VectorAnalysisUIFigure = uifigure('Visible', 'off');
            app.VectorAnalysisUIFigure.Color = [1 1 1];
            app.VectorAnalysisUIFigure.Position = [100 100 640 370];
            app.VectorAnalysisUIFigure.Name = 'Vector Analysis';
            app.VectorAnalysisUIFigure.Icon = fullfile(pathToMLAPP, 'Logo2.png');
            app.VectorAnalysisUIFigure.Resize = 'off';

            % Create Menu
            app.Menu = uimenu(app.VectorAnalysisUIFigure);
            app.Menu.Text = 'Menu';

            % Create InfoMenu
            app.InfoMenu = uimenu(app.Menu);
            app.InfoMenu.MenuSelectedFcn = createCallbackFcn(app, @InfoMenuSelected, true);
            app.InfoMenu.Text = 'Info';

            % Create Image
            app.Image = uiimage(app.VectorAnalysisUIFigure);
            app.Image.Position = [463 160 138 139];
            app.Image.ImageSource = 'logo.png';

            % Create GradientButton
            app.GradientButton = uibutton(app.VectorAnalysisUIFigure, 'push');
            app.GradientButton.ButtonPushedFcn = createCallbackFcn(app, @GradientButtonPushed, true);
            app.GradientButton.FontSize = 24;
            app.GradientButton.FontWeight = 'bold';
            app.GradientButton.Position = [54 255 322 50];
            app.GradientButton.Text = 'Gradient';

            % Create DivergenceButton
            app.DivergenceButton = uibutton(app.VectorAnalysisUIFigure, 'push');
            app.DivergenceButton.ButtonPushedFcn = createCallbackFcn(app, @DivergenceButtonPushed, true);
            app.DivergenceButton.FontSize = 24;
            app.DivergenceButton.FontWeight = 'bold';
            app.DivergenceButton.Position = [54 166 322 50];
            app.DivergenceButton.Text = 'Divergence';

            % Create CurlButton
            app.CurlButton = uibutton(app.VectorAnalysisUIFigure, 'push');
            app.CurlButton.ButtonPushedFcn = createCallbackFcn(app, @CurlButtonPushed, true);
            app.CurlButton.FontSize = 24;
            app.CurlButton.FontWeight = 'bold';
            app.CurlButton.Position = [54 76 322 50];
            app.CurlButton.Text = 'Curl';

            % Show the figure after all components are created
            app.VectorAnalysisUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = VectorAnalysis

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.VectorAnalysisUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.VectorAnalysisUIFigure)
        end
    end
end