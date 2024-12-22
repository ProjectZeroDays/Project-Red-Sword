
def calculate_roi(investment, returns):
    roi = ((returns - investment) / investment) * 100
    print(f"ROI: {roi:.2f}%")
    return roi

if __name__ == "__main__":
    calculate_roi(10000, 15000)
