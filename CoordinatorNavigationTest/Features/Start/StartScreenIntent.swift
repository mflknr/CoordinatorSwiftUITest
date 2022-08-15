enum StartScreenIntent {
    case finishedLoading([Book])
    case detailsTap(Book)
    case resetTap
    case toggle(Bool)
}
