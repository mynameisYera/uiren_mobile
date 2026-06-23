enum InfoStatus { approved, rejected, waiting, inprogress }

InfoStatus getInfoStatus(String status) {
  const approvedStatuses = {
    'APPROVED_BY_HR',
    'APPROVED_BY_TRAVEL_COORDINATOR',
    'APPROVED_BY_SB',
    'APPROVED_BY_AED',
    'APPROVED_BY_LABOR_PROTECTION',
    'APPROVED_BY_DIRECTOR',
    'APPROVED_BY_ACCOUNTANT',
    'FINISHED',
  };

  const waitingStatuses = {
    'PENDING',
    
  };

  const inProgressStatuses = {
    'IN_WORK',
    'NEEDS_ADDITIONAL_INFO',
    'EDITED',
  };

  const rejectedStatuses = {
    'REJECTED',
  };

  if (approvedStatuses.contains(status)) {
    return InfoStatus.approved;
  } else if (rejectedStatuses.contains(status)) {
    return InfoStatus.rejected;
  } else if (waitingStatuses.contains(status)) {
    return InfoStatus.waiting;
  } else if (inProgressStatuses.contains(status)) {
    return InfoStatus.inprogress;
  } else {
    throw InfoStatus.inprogress;
  }
}


InfoStatus getInfoStatusOf(String? status) {
  switch (status) {
    case 'Отклонена':
      return InfoStatus.rejected;
    case 'Одобрена всеми участниками':
      return InfoStatus.approved;
    case 'В ожидании':
    case 'Заявка отредактирована':
    case 'Нужна дополнительная информация':
      return InfoStatus.inprogress;
    default:
      return InfoStatus.inprogress;
  }
}
