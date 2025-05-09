def test_pytorch():
    print_section("PyTorch 测试")
    try:
        torch = importlib.import_module('torch')
        print(f"此脚本与pytorch不兼容")
        return False
    except Exception as e:
        return True

if __name__=='__main__':
    test_pytorch()
else
    print("错误")
