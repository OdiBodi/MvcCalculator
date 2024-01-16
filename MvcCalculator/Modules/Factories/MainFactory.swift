struct MainFactory {
    func module() -> MainViewController {
        let model = MainModel()
        let view = MainView()
        let controller = MainViewController()

        view.initialize(model: model, controller: controller)
        controller.initialize(model: model, view: view)

        return controller
    }
}
