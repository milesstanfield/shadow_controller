require "shadow_controller/version"

module ShadowController
  def shadow_controller
    controller = self.described_class
    raise_misuse if misused? controller
    mock controller
    draw_routes controller
  end

  private

  def actions(controller)
    controller.action_methods
  end

  def raise_misuse
    raise "ControllerMime is currently limited to use with ApplicationController only"
  end

  def misused?(controller)
    controller != ApplicationController
  end

  def first_action(controller)
    actions(controller).first
  end

  def draw_routes(controller)
    before do
      routes.draw do
        eval dynamic_routes(controller).join(" ")
      end
    end
  end

  def mock(controller)
    method = first_action(controller).to_sym
    controller_path = controller.instance_method(method).source_location[0]
    controller { eval File.read(controller_path) }
  end

  def dynamic_routes(controller)
    actions(controller).map do |action|
      %Q[
        get "/anonymous/#{action}"
        post "/anonymous/#{action}"
        patch "/anonymous/#{action}"
        put "/anonymous/#{action}"
        delete "/anonymous/#{action}"
      ]
    end
  end
end
