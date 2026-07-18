run "default_workspace_plan" {
  command = plan

  assert {
    condition     = output.workspace_name == "default"
    error_message = "The default workspace should be active during this test."
  }

  assert {
    condition     = output.instance_size == "t3.micro"
    error_message = "Default workspace must use t3.micro."
  }
}
