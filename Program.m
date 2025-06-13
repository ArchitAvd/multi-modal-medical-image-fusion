classdef Program < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure           matlab.ui.Figure
        GridLayout         matlab.ui.container.GridLayout
        MergeCTMRIButton   matlab.ui.control.Button
        MergeMRIPETButton  matlab.ui.control.Button
        MultiModalMedicalImageFusionLabel  matlab.ui.control.Label
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: MergeCTMRIButton
        function MergeCTMRIButtonPushed(app, event)
            run('Script_CT.m')
        end

        % Button pushed function: MergeMRIPETButton
        function MergeMRIPETButtonPushed(app, event)
            run('Script.m')
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {240, 170, 230};
            app.GridLayout.RowHeight = {72, '1.97x', 40, '1.33x', 40, '1x'};
            app.GridLayout.ColumnSpacing = 0;
            app.GridLayout.Padding = [0 10 0 10];
            app.GridLayout.Scrollable = 'on';

            % Create MergeCTMRIButton
            app.MergeCTMRIButton = uibutton(app.GridLayout, 'push');
            app.MergeCTMRIButton.ButtonPushedFcn = createCallbackFcn(app, @MergeCTMRIButtonPushed, true);
            app.MergeCTMRIButton.IconAlignment = 'center';
            app.MergeCTMRIButton.FontSize = 20;
            app.MergeCTMRIButton.Layout.Row = 3;
            app.MergeCTMRIButton.Layout.Column = 2;
            app.MergeCTMRIButton.Text = 'Merge CT-MRI';

            % Create MergeMRIPETButton
            app.MergeMRIPETButton = uibutton(app.GridLayout, 'push');
            app.MergeMRIPETButton.ButtonPushedFcn = createCallbackFcn(app, @MergeMRIPETButtonPushed, true);
            app.MergeMRIPETButton.FontSize = 20;
            app.MergeMRIPETButton.Layout.Row = 5;
            app.MergeMRIPETButton.Layout.Column = 2;
            app.MergeMRIPETButton.Text = 'Merge MRI-PET';

            % Create MultiModalMedicalImageFusionLabel
            app.MultiModalMedicalImageFusionLabel = uilabel(app.GridLayout);
            app.MultiModalMedicalImageFusionLabel.HorizontalAlignment = 'center';
            app.MultiModalMedicalImageFusionLabel.FontName = 'Times New Roman';
            app.MultiModalMedicalImageFusionLabel.FontSize = 36;
            app.MultiModalMedicalImageFusionLabel.Layout.Row = 1;
            app.MultiModalMedicalImageFusionLabel.Layout.Column = [1 3];
            app.MultiModalMedicalImageFusionLabel.Text = 'Multi Modal Medical Image Fusion';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Program

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end