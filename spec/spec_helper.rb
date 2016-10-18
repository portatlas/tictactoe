def capture_puts
  begin
    $stdout = StringIO.new('','w')
    yield
    $stdout.string
  end
end