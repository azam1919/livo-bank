-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 23, 2022 at 06:06 PM
-- Server version: 10.3.32-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mezilwbo_de`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descriptions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` decimal(10,6) NOT NULL,
  `base_currency` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `name`, `exchange_rate`, `base_currency`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USD', 1.000000, 1, 1, NULL, '2022-08-11 00:06:54'),
(2, 'EUR', 0.850000, 0, 0, NULL, '2022-08-11 00:06:16');

-- --------------------------------------------------------

--
-- Table structure for table `database_backups`
--

CREATE TABLE `database_backups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposit_methods`
--

CREATE TABLE `deposit_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` bigint(20) NOT NULL,
  `minimum_amount` decimal(10,2) NOT NULL,
  `maximum_amount` decimal(10,2) NOT NULL,
  `fixed_charge` decimal(10,2) NOT NULL,
  `charge_in_percentage` decimal(10,2) NOT NULL,
  `descriptions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `requirements` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposit_requests`
--

CREATE TABLE `deposit_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `method_id` bigint(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requirements` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `transaction_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_sms_templates`
--

CREATE TABLE `email_sms_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcode` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_status` tinyint(4) NOT NULL DEFAULT 1,
  `sms_status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_sms_templates`
--

INSERT INTO `email_sms_templates` (`id`, `name`, `slug`, `subject`, `email_body`, `sms_body`, `shortcode`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'Deposit Money', 'DEPOSIT_MONEY', 'Deposit Money', '<div>\r\n<div>Dear Sir,</div>\r\n<div>Your account has been credited by {{amount}} on {{dateTime}}</div>\r\n</div>', 'Dear Sir, Your account has been credited by {{amount}} on {{dateTime}}', '{{name}} {{email}} {{phone}} {{amount}} {{dateTime}}', 0, 0, NULL, NULL),
(2, 'Deposit Request Approved', 'DEPOSIT_REQUEST_APPROVED', 'Deposit Request Approved', '<div>\r\n<div>Dear Sir,</div>\r\n<div>Your deposit request has been approved. Your account has been credited by {{amount}} on {{dateTime}}</div>\r\n</div>', 'Dear Sir, Your deposit request has been approved. Your account has been credited by {{amount}} on {{dateTime}}', '{{name}} {{email}} {{phone}} {{amount}} {{dateTime}} {{depositMethod}}', 0, 0, NULL, NULL),
(3, 'FDR Request Approved', 'FDR_REQUEST_APPROVED', 'FDR Request Approved', '<div>\r\n<div>Dear Sir,</div>\r\n<div>Your FDR request of {{amount}} has been approved on {{dateTime}}</div>\r\n</div>', 'Dear Sir, Your FDR request of {{amount}} has been approved on {{dateTime}}', '{{name}} {{email}} {{phone}} {{amount}} {{dateTime}}', 0, 0, NULL, NULL),
(4, 'Loan Request Approved', 'LOAN_REQUEST_APPROVED', 'Loan Request Approved', '<div>\r\n<div>Dear Sir,</div>\r\n<div>Your loan request has been approved. Your account has been credited by {{amount}} on {{dateTime}}</div>\r\n</div>', 'Dear Sir, Your loan request has been approved. Your account has been credited by {{amount}} on {{dateTime}}', '{{name}} {{email}} {{phone}} {{amount}} {{dateTime}}', 0, 0, NULL, NULL),
(5, 'Transfer Request Approved', 'TRANSFER_REQUEST_APPROVED', 'Transfer Request Approved', '<div>\r\n<div>Dear Sir,</div>\r\n<div>Your transfer request has been approved. Your account has been debited by {{amount}} on {{dateTime}}</div>\r\n</div>', 'Dear Sir, Your transfer request has been approved. Your account has been debited by {{amount}} on {{dateTime}}', '{{name}} {{email}} {{phone}} {{amount}} {{dateTime}}', 0, 0, NULL, NULL),
(6, 'Wire Transfer Request Approved', 'WIRE_TRANSFER_REQUEST_APPROVED', 'Wire Transfer Request Approved', '<div>\r\n<div>Dear Sir,</div>\r\n<div>Your wire transfer request has been approved. Your account has been debited by {{amount}} on {{dateTime}}</div>\r\n</div>', 'Dear Sir, Your wire transfer request has been approved. Your account has been debited by {{amount}} on {{dateTime}}', '{{name}} {{email}} {{phone}} {{amount}} {{dateTime}}', 0, 0, NULL, NULL),
(7, 'Withdraw Request Approved', 'WITHDRAW_REQUEST_APPROVED', 'Withdraw Request Approved', '<div>\r\n<div>Dear Sir,</div>\r\n<div>Your withdraw request has been approved. Your account has been debited by {{amount}} on {{dateTime}}</div>\r\n</div>', 'Dear Sir, Your withdraw request has been approved. Your account has been debited by {{amount}} on {{dateTime}}', '{{name}} {{email}} {{phone}} {{amount}} {{dateTime}}', 0, 0, NULL, NULL),
(8, 'FDR Matured', 'FDR_MATURED', 'FDR Matured', '<div>\r\n<div>Dear Sir,</div>\r\n<div>Your FDR is already matured. Your account has been credited by {{amount}} on {{dateTime}}</div>\r\n</div>', 'Dear Sir, Your FDR is already matured. Your account has been credited by {{amount}} on {{dateTime}}', '{{name}} {{email}} {{phone}} {{amount}} {{dateTime}}', 0, 0, NULL, NULL),
(9, 'Payment Request', 'PAYMENT_REQUEST', 'You have Received New Payment Request', '<div>Dear Sir,</div>\r\n<div>Your have received new payment request of {{amount}} on {{dateTime}}.</div>\r\n<div>&nbsp;</div>\r\n<div>{{payNow}}</div>', 'Dear Sir, Your have received new payment request of {{amount}} on {{dateTime}}', '{{name}} {{email}} {{phone}} {{amount}} {{dateTime}} {{payNow}}', 0, 0, NULL, NULL),
(10, 'Payment Completed', 'PAYMENT_COMPLETED', 'Payment Completed', '<div>Dear Sir,</div>\r\n<div>Good news, You have received a payment of {{amount}} on {{dateTime}} from {{paidBy}}</div>', 'Dear Sir, Good news, You have received a payment of {{amount}} on {{dateTime}} from {{paidBy}}', '{{name}} {{email}} {{phone}} {{amount}} {{dateTime}} {{paidBy}}', 0, 0, NULL, NULL),
(11, 'Deposit Request Rejected', 'DEPOSIT_REQUEST_REJECTED', 'Deposit Request Rejected', '<div>\r\n<div>Dear Sir,</div>\r\n<div>Your deposit request of {{amount}} has been rejected.</div>\r\n<div>&nbsp;</div>\r\n<div>Amount:&nbsp;{{amount}}</div>\r\n<div>Deposit Method: {{depositMethod}}</div>\r\n</div>', 'Dear Sir, Your deposit request of {{amount}} has been rejected.', '{{name}} {{email}} {{phone}} {{amount}} {{depositMethod}}', 0, 0, NULL, NULL),
(12, 'FDR Request Rejected', 'FDR_REQUEST_REJECTED', 'FDR Request Rejected', '<div>\r\n<div>Dear Sir,</div>\r\n<div>Your FDR request has been rejected. Your FDR amount {{amount}} has returned back to your account.</div>\r\n</div>', 'Dear Sir, Your FDR request has been rejected. Your FDR amount {{amount}} has returned back to your account.', '{{name}} {{email}} {{phone}} {{amount}}', 0, 0, NULL, NULL),
(13, 'Loan Request Rejected', 'LOAN_REQUEST_REJECTED', 'Loan Request Rejected', '<div>\r\n<div>Dear Sir,</div>\r\n<div>Your loan request of {{amount}} has been rejected on {{dateTime}}</div>\r\n</div>', 'Dear Sir, Your loan request of {{amount}} has been rejected on {{dateTime}}', '{{name}} {{email}} {{phone}} {{amount}} {{dateTime}}', 0, 0, NULL, NULL),
(14, 'Transfer Request Rejected', 'TRANSFER_REQUEST_REJECTED', 'Transfer Request Rejected', '<div>\r\n<div>Dear Sir,</div>\r\n<div>Your transfer request has been rejected. Your transferred amount {{amount}} has returned back to your account.</div>\r\n</div>', 'Dear Sir, Your transfer request has been rejected. Your transferred amount {{amount}} has returned back to your account.', '{{name}} {{email}} {{phone}} {{amount}}', 0, 0, NULL, NULL),
(15, 'Wire Transfer Rejected', 'WIRE_TRANSFER_REJECTED', 'Wire Transfer Rejected', '<div>\r\n<div>Dear Sir,</div>\r\n<div>Your wire transfer request has been rejected. Your transferred amount {{amount}} has returned back to your account.</div>\r\n</div>', 'Dear Sir, Your wire transfer request has been rejected. Your transferred amount {{amount}} has returned back to your account.', '{{name}} {{email}} {{phone}} {{amount}}', 0, 0, NULL, NULL),
(16, 'Withdraw Request Rejected', 'WITHDRAW_REQUEST_REJECTED', 'Withdraw Request Rejected', '<div>\r\n<div>Dear Sir, Your withdraw request has been rejected. Your transferred amount {{amount}} has returned back to your account.</div>\r\n</div>', 'Dear Sir, Your withdraw request has been rejected. Your transferred amount {{amount}} has returned back to your account.', '{{name}} {{email}} {{phone}} {{amount}}', 0, 0, NULL, NULL),
(17, 'Withdraw Money', 'WITHDRAW_MONEY', 'Withdraw Money', '<div>\r\n<div>Dear Sir,</div>\r\n<div>Your account has been debited by {{amount}} on {{dateTime}}</div>\r\n</div>', 'Dear Sir, Your account has been debited by {{amount}} on {{dateTime}}', '{{name}} {{email}} {{phone}} {{amount}} {{dateTime}} {{withdrawMethod}}', 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, '2021-08-31 10:06:18', '2021-08-31 10:06:18'),
(2, 1, NULL, '2021-08-31 10:09:26', '2021-08-31 10:09:26'),
(3, 1, NULL, '2021-08-31 10:09:39', '2021-08-31 10:09:39'),
(4, 1, NULL, '2021-09-05 15:47:59', '2021-09-05 15:47:59'),
(5, 1, NULL, '2021-09-05 15:58:05', '2021-09-05 15:58:05');

-- --------------------------------------------------------

--
-- Table structure for table `faq_translations`
--

CREATE TABLE `faq_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `faq_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_translations`
--

INSERT INTO `faq_translations` (`id`, `faq_id`, `locale`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 1, 'English', 'How to open an account?', 'Account opening is very easy. Just need to click Sign Up and enter some initial details for opening account. After that you need to verify your email address and that\'s ready to go.', '2021-08-31 10:07:50', '2021-09-05 15:37:10'),
(2, 2, 'English', 'How to deposit money?', 'You can deposit money via online payment gateway such as PayPal, Stripe, Razorpay, Paystack, Flutterwave as well as BlockChain for bitcoin. You can also deposit money by coming to our office physically.', '2021-08-31 10:09:26', '2021-09-05 15:38:39'),
(3, 3, 'English', 'How to withdraw money from my account?', 'We have different types of withdraw method. You can withdraw money to your bank account as well as your mobile banking account.', '2021-08-31 10:09:39', '2021-09-05 15:47:11'),
(7, 4, 'English', 'How to Apply for Loan?', 'You can apply loan based on your collateral.', '2021-09-05 15:47:59', '2021-09-05 15:47:59'),
(8, 5, 'English', 'How to Apply for Fixed Deposit?', 'If you have available balance in your account then you can apply for fixed deposit.', '2021-09-05 15:58:05', '2021-09-05 15:58:05');

-- --------------------------------------------------------

--
-- Table structure for table `fdrs`
--

CREATE TABLE `fdrs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fdr_plan_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `deposit_amount` decimal(10,2) NOT NULL,
  `return_amount` decimal(10,2) NOT NULL,
  `attachment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `approved_date` date DEFAULT NULL,
  `mature_date` date DEFAULT NULL,
  `transaction_id` bigint(20) DEFAULT NULL,
  `approved_user_id` bigint(20) DEFAULT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fdrs`
--

INSERT INTO `fdrs` (`id`, `fdr_plan_id`, `user_id`, `currency_id`, `deposit_amount`, `return_amount`, `attachment`, `remarks`, `status`, `approved_date`, `mature_date`, `transaction_id`, `approved_user_id`, `created_user_id`, `updated_user_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 10.00, 10.80, '165976196689E1EBEB-E278-483B-8E4A-39AEE488C2F5.jpeg', 'ykk', 2, NULL, '2023-08-06', 2, NULL, 2, NULL, NULL, '2022-08-06 07:59:26', '2022-08-06 08:01:27'),
(2, 3, 3, 1, 19000.00, 21850.00, '16601657491184EBD4-6F7C-47FC-87A1-CC328E0419C2.jpeg', 'here to invest', 1, '2022-08-11', '2025-08-11', 4, 1, 3, NULL, NULL, '2022-08-11 00:09:09', '2022-08-11 00:09:24'),
(3, 1, 3, 1, 500.00, 540.00, '', NULL, 0, NULL, '2023-08-15', 14, NULL, 3, NULL, NULL, '2022-08-15 21:48:09', '2022-08-15 21:48:09');

-- --------------------------------------------------------

--
-- Table structure for table `fdr_plans`
--

CREATE TABLE `fdr_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minimum_amount` decimal(10,2) NOT NULL,
  `maximum_amount` decimal(10,2) NOT NULL,
  `interest_rate` decimal(10,2) NOT NULL,
  `duration` int(11) NOT NULL,
  `duration_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fdr_plans`
--

INSERT INTO `fdr_plans` (`id`, `name`, `minimum_amount`, `maximum_amount`, `interest_rate`, `duration`, `duration_type`, `status`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Basic', 10.00, 500.00, 8.00, 12, 'month', 1, NULL, '2021-08-09 14:34:14', '2021-09-05 13:39:27'),
(2, 'Standard', 100.00, 1000.00, 10.00, 24, 'month', 1, NULL, '2021-09-05 13:39:11', '2021-09-05 13:39:34'),
(3, 'Professional', 500.00, 20000.00, 15.00, 36, 'month', 1, NULL, '2021-09-05 13:40:06', '2021-09-05 13:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `gift_cards`
--

CREATE TABLE `gift_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` bigint(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `user_id` bigint(20) DEFAULT NULL,
  `used_at` datetime DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `loan_id` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loan_product_id` bigint(20) UNSIGNED NOT NULL,
  `borrower_id` bigint(20) UNSIGNED NOT NULL,
  `first_payment_date` date NOT NULL,
  `release_date` date DEFAULT NULL,
  `currency_id` bigint(20) NOT NULL,
  `applied_amount` decimal(10,2) NOT NULL,
  `total_payable` decimal(10,2) DEFAULT NULL,
  `total_paid` decimal(10,2) DEFAULT NULL,
  `late_payment_penalties` decimal(10,2) NOT NULL,
  `attachment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `approved_date` date DEFAULT NULL,
  `approved_user_id` bigint(20) DEFAULT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `loan_id`, `loan_product_id`, `borrower_id`, `first_payment_date`, `release_date`, `currency_id`, `applied_amount`, `total_payable`, `total_paid`, `late_payment_penalties`, `attachment`, `description`, `remarks`, `status`, `approved_date`, `approved_user_id`, `created_user_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(5, '236543', 2, 3, '2022-08-21', '2022-09-01', 1, 980900.00, 1045821.32, 174303.56, 0.00, '', 'For business', NULL, 1, '2022-08-21', 1, 1, NULL, '2022-08-21 19:49:05', '2022-08-22 20:59:58');

-- --------------------------------------------------------

--
-- Table structure for table `loan_collaterals`
--

CREATE TABLE `loan_collaterals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `loan_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `collateral_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimated_price` decimal(10,2) NOT NULL,
  `attachments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_payments`
--

CREATE TABLE `loan_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `loan_id` bigint(20) NOT NULL,
  `paid_at` date NOT NULL,
  `late_penalties` decimal(10,2) NOT NULL,
  `interest` decimal(10,2) NOT NULL,
  `amount_to_pay` decimal(10,2) NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `transaction_id` bigint(20) NOT NULL,
  `repayment_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loan_payments`
--

INSERT INTO `loan_payments` (`id`, `loan_id`, `paid_at`, `late_penalties`, `interest`, `amount_to_pay`, `remarks`, `user_id`, `transaction_id`, `repayment_id`, `created_at`, `updated_at`) VALUES
(6, 5, '2022-08-21', 0.00, 9809.00, 87151.78, NULL, 3, 16, 37, '2022-08-21 19:50:41', '2022-08-21 19:50:41'),
(7, 5, '2022-08-22', 0.00, 9035.57, 87151.78, NULL, 3, 17, 38, '2022-08-22 20:59:58', '2022-08-22 20:59:58');

-- --------------------------------------------------------

--
-- Table structure for table `loan_products`
--

CREATE TABLE `loan_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minimum_amount` decimal(10,2) NOT NULL,
  `maximum_amount` decimal(10,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interest_rate` decimal(10,2) NOT NULL,
  `interest_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `term` int(11) NOT NULL,
  `term_period` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loan_products`
--

INSERT INTO `loan_products` (`id`, `name`, `minimum_amount`, `maximum_amount`, `description`, `interest_rate`, `interest_type`, `term`, `term_period`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Student Loan', 100.00, 1000.00, NULL, 5.00, 'flat_rate', 24, '+1 month', 1, '2021-08-09 11:06:19', '2021-08-10 07:47:20'),
(2, 'Business Loan', 1000.00, 100000.00, NULL, 12.00, 'mortgage', 12, '+1 month', 1, '2021-08-09 11:05:37', '2021-08-10 07:47:10'),
(3, 'Enterprise Loan', 5000.00, 50000.00, NULL, 12.00, 'mortgage', 36, '+1 month', 1, '2021-09-05 13:42:11', '2021-09-05 13:42:11');

-- --------------------------------------------------------

--
-- Table structure for table `loan_repayments`
--

CREATE TABLE `loan_repayments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `loan_id` bigint(20) NOT NULL,
  `repayment_date` date NOT NULL,
  `amount_to_pay` decimal(10,2) NOT NULL,
  `penalty` decimal(10,2) NOT NULL,
  `principal_amount` decimal(10,2) NOT NULL,
  `interest` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loan_repayments`
--

INSERT INTO `loan_repayments` (`id`, `loan_id`, `repayment_date`, `amount_to_pay`, `penalty`, `principal_amount`, `interest`, `balance`, `status`, `created_at`, `updated_at`) VALUES
(37, 5, '2022-08-21', 87151.78, 0.00, 77342.78, 9809.00, 903557.22, 1, '2022-08-21 19:49:39', '2022-08-21 19:50:41'),
(38, 5, '2022-09-21', 87151.78, 0.00, 78116.20, 9035.57, 825441.02, 1, '2022-08-21 19:49:39', '2022-08-22 20:59:58'),
(39, 5, '2022-10-21', 87151.78, 0.00, 78897.37, 8254.41, 746543.65, 0, '2022-08-21 19:49:39', '2022-08-21 19:49:39'),
(40, 5, '2022-11-21', 87151.78, 0.00, 79686.34, 7465.44, 666857.31, 0, '2022-08-21 19:49:39', '2022-08-21 19:49:39'),
(41, 5, '2022-12-21', 87151.78, 0.00, 80483.20, 6668.57, 586374.11, 0, '2022-08-21 19:49:39', '2022-08-21 19:49:39'),
(42, 5, '2023-01-21', 87151.78, 0.00, 81288.04, 5863.74, 505086.07, 0, '2022-08-21 19:49:39', '2022-08-21 19:49:39'),
(43, 5, '2023-02-21', 87151.78, 0.00, 82100.92, 5050.86, 422985.16, 0, '2022-08-21 19:49:39', '2022-08-21 19:49:39'),
(44, 5, '2023-03-21', 87151.78, 0.00, 82921.93, 4229.85, 340063.23, 0, '2022-08-21 19:49:39', '2022-08-21 19:49:39'),
(45, 5, '2023-04-21', 87151.78, 0.00, 83751.14, 3400.63, 256312.09, 0, '2022-08-21 19:49:39', '2022-08-21 19:49:39'),
(46, 5, '2023-05-21', 87151.78, 0.00, 84588.66, 2563.12, 171723.43, 0, '2022-08-21 19:49:39', '2022-08-21 19:49:39'),
(47, 5, '2023-06-21', 87151.78, 0.00, 85434.54, 1717.23, 86288.89, 0, '2022-08-21 19:49:39', '2022-08-21 19:49:39'),
(48, 5, '2023-07-21', 87151.78, 0.00, 86288.89, 862.89, 0.00, 0, '2022-08-21 19:49:39', '2022-08-21 19:49:39');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_11_12_152015_create_email_templates_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_09_01_080940_create_settings_table', 1),
(6, '2020_07_02_145857_create_database_backups_table', 1),
(7, '2020_07_06_142817_create_roles_table', 1),
(8, '2020_07_06_143240_create_permissions_table', 1),
(9, '2021_03_22_071324_create_setting_translations', 1),
(10, '2021_07_02_145504_create_pages_table', 1),
(11, '2021_07_02_145952_create_page_translations_table', 1),
(12, '2021_08_06_104648_create_branches_table', 1),
(13, '2021_08_07_100944_create_other_banks_table', 1),
(14, '2021_08_07_111236_create_currency_table', 1),
(15, '2021_08_08_132702_create_payment_gateways_table', 1),
(16, '2021_08_08_152535_create_deposit_methods_table', 1),
(17, '2021_08_08_164152_create_withdraw_methods_table', 1),
(18, '2021_08_09_064023_create_transactions_table', 1),
(19, '2021_08_09_132854_create_fdr_plans_table', 1),
(20, '2021_08_10_075622_create_gift_cards_table', 1),
(21, '2021_08_10_095536_create_fdrs_table', 1),
(22, '2021_08_10_102503_create_support_tickets_table', 1),
(23, '2021_08_10_102527_create_support_ticket_messages_table', 1),
(24, '2021_08_20_092846_create_payment_requests_table', 1),
(25, '2021_08_20_150101_create_deposit_requests_table', 1),
(26, '2021_08_20_160124_create_withdraw_requests_table', 1),
(27, '2021_08_23_160216_create_notifications_table', 1),
(28, '2021_08_31_070908_create_services_table', 1),
(29, '2021_08_31_071002_create_service_translations_table', 1),
(30, '2021_08_31_075115_create_news_table', 1),
(31, '2021_08_31_075125_create_news_translations_table', 1),
(32, '2021_08_31_094252_create_faqs_table', 1),
(33, '2021_08_31_094301_create_faq_translations_table', 1),
(34, '2021_08_31_101309_create_testimonials_table', 1),
(35, '2021_08_31_101319_create_testimonial_translations_table', 1),
(36, '2021_08_31_201125_create_navigations_table', 1),
(37, '2021_08_31_201126_create_navigation_items_table', 1),
(38, '2021_08_31_201127_create_navigation_item_translations_table', 1),
(39, '2021_09_04_142110_create_teams_table', 1),
(40, '2021_10_04_082019_create_loan_products_table', 1),
(41, '2021_10_06_070947_create_loans_table', 1),
(42, '2021_10_06_071153_create_loan_collaterals_table', 1),
(43, '2021_10_09_110842_add_2fa_columns_to_users_table', 1),
(44, '2021_10_12_071843_add_allow_withdrawal_to_users_table', 1),
(45, '2021_10_12_104151_create_loan_repayments_table', 1),
(46, '2021_10_14_065743_create_loan_payments_table', 1),
(47, '2021_10_22_070458_create_email_sms_templates_table', 1),
(48, '2022_02_01_071417_add_account_number_to_users_table', 1),
(49, '2022_02_10_053301_add_document_verified_at_to_users_table', 1),
(50, '2022_02_10_063611_create_user_documents_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `navigations`
--

CREATE TABLE `navigations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `navigations`
--

INSERT INTO `navigations` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Primary Menu', 1, '2021-08-31 11:11:31', '2021-08-31 11:11:31'),
(2, 'Quick Explore', 1, '2021-08-31 18:11:36', '2021-08-31 18:11:36'),
(3, 'Pages', 1, '2021-08-31 18:11:43', '2021-09-04 16:22:30');

-- --------------------------------------------------------

--
-- Table structure for table `navigation_items`
--

CREATE TABLE `navigation_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `navigation_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_id` bigint(20) UNSIGNED DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `position` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `css_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `navigation_items`
--

INSERT INTO `navigation_items` (`id`, `navigation_id`, `type`, `page_id`, `url`, `icon`, `target`, `parent_id`, `position`, `status`, `css_class`, `css_id`, `created_at`, `updated_at`) VALUES
(6, 1, 'dynamic_url', NULL, '/', NULL, '_self', NULL, 1, 1, NULL, NULL, '2021-08-31 17:17:46', '2021-08-31 17:28:52'),
(7, 1, 'dynamic_url', NULL, '/about', NULL, '_self', NULL, 2, 1, NULL, NULL, '2021-08-31 17:17:58', '2021-08-31 17:28:52'),
(8, 1, 'dynamic_url', NULL, '/services', NULL, '_self', NULL, 3, 1, NULL, NULL, '2021-08-31 17:18:44', '2021-08-31 17:28:52'),
(10, 1, 'dynamic_url', NULL, 'faq', NULL, '_self', NULL, 4, 1, NULL, NULL, '2021-08-31 17:19:27', '2021-09-04 16:20:28'),
(11, 1, 'dynamic_url', NULL, '/contact', NULL, '_self', NULL, 5, 1, NULL, NULL, '2021-08-31 17:19:43', '2021-09-04 16:20:28'),
(15, 2, 'dynamic_url', NULL, '/contact', NULL, '_self', NULL, 1, 1, NULL, NULL, '2021-08-31 18:12:42', '2021-09-04 16:22:17'),
(20, 2, 'dynamic_url', NULL, '/about', NULL, '_self', NULL, 2, 1, NULL, NULL, '2021-09-04 16:21:32', '2021-09-04 16:22:17'),
(21, 2, 'dynamic_url', NULL, '/services', NULL, '_self', NULL, 3, 1, NULL, NULL, '2021-09-04 16:22:06', '2021-09-04 16:22:17'),
(22, 3, 'page', 2, NULL, NULL, '_self', NULL, 2, 1, NULL, NULL, '2021-09-04 16:22:58', '2021-09-04 16:23:26'),
(23, 3, 'page', 1, NULL, NULL, '_self', NULL, 1, 1, NULL, NULL, '2021-09-04 16:23:10', '2021-09-04 16:23:26'),
(24, 3, 'dynamic_url', NULL, '/faq', NULL, '_self', NULL, 3, 1, NULL, NULL, '2021-09-04 16:23:20', '2021-09-04 16:23:26');

-- --------------------------------------------------------

--
-- Table structure for table `navigation_item_translations`
--

CREATE TABLE `navigation_item_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `navigation_item_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `navigation_item_translations`
--

INSERT INTO `navigation_item_translations` (`id`, `navigation_item_id`, `locale`, `name`, `created_at`, `updated_at`) VALUES
(6, 6, 'English', 'Home', '2021-08-31 17:17:46', '2021-08-31 17:17:46'),
(7, 7, 'English', 'About', '2021-08-31 17:17:58', '2021-08-31 17:17:58'),
(8, 8, 'English', 'Services', '2021-08-31 17:18:44', '2021-08-31 17:18:44'),
(10, 10, 'English', 'FAQ', '2021-08-31 17:19:27', '2021-08-31 17:19:27'),
(11, 11, 'English', 'Contact', '2021-08-31 17:19:43', '2021-08-31 17:19:43'),
(15, 15, 'English', 'Contact', '2021-08-31 18:12:42', '2021-09-04 16:22:15'),
(26, 20, 'English', 'About', '2021-09-04 16:21:32', '2021-09-04 16:21:32'),
(27, 21, 'English', 'Services', '2021-09-04 16:22:06', '2021-09-04 16:22:06'),
(28, 22, 'English', 'Terms & Condition', '2021-09-04 16:22:58', '2021-09-04 16:22:58'),
(29, 23, 'English', 'Privacy Policy', '2021-09-04 16:23:10', '2021-09-04 16:23:10'),
(30, 24, 'English', 'FAQ', '2021-09-04 16:23:20', '2021-09-04 16:23:20');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_user_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news_translations`
--

CREATE TABLE `news_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `news_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('06da7dfe-676c-45da-af9e-b9f87e40e815', 'App\\Notifications\\ApprovedFDRRequest', 'App\\Models\\User', 3, '{\"message\":\"Dear Sir, Your FDR request of $19,000.00 has been approved on 2022-08-11 00:09\"}', NULL, '2022-08-11 00:09:24', '2022-08-11 00:09:24'),
('20294f54-082b-49da-84d4-90aae16e7f83', 'App\\Notifications\\ApprovedLoanRequest', 'App\\Models\\User', 3, '{\"message\":\"Dear Sir, Your loan request has been approved. Your account has been credited by $500,000.00 on 2022-08-11 00:04\"}', NULL, '2022-08-11 00:04:05', '2022-08-11 00:04:05'),
('7091008d-0b2c-4e85-90d3-c1c8befeaa91', 'App\\Notifications\\ApprovedLoanRequest', 'App\\Models\\User', 3, '{\"message\":\"Dear Sir, Your loan request has been approved. Your account has been credited by $980,900.00 on 2022-08-21 19:49\"}', NULL, '2022-08-21 19:49:39', '2022-08-21 19:49:39'),
('8fdc21ac-a495-4f1f-9947-b16002a742b9', 'App\\Notifications\\RejectFDRRequest', 'App\\Models\\User', 2, '{\"message\":\"Dear Sir, Your FDR request has been rejected. Your FDR amount $10.00 has returned back to your account.\"}', '2022-08-06 08:01:42', '2022-08-06 08:01:28', '2022-08-06 08:01:42'),
('cc12d870-a58b-48da-a657-e1407e8499ef', 'App\\Notifications\\ApprovedLoanRequest', 'App\\Models\\User', 2, '{\"message\":\"Dear Sir, Your loan request has been approved. Your account has been credited by $100.00 on 2022-08-01 11:54 PM\"}', '2022-08-01 23:55:05', '2022-08-01 23:54:30', '2022-08-01 23:55:05');

-- --------------------------------------------------------

--
-- Table structure for table `other_banks`
--

CREATE TABLE `other_banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `swift_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_currency` bigint(20) NOT NULL,
  `minimum_transfer_amount` decimal(10,2) NOT NULL,
  `maximum_transfer_amount` decimal(10,2) NOT NULL,
  `fixed_charge` decimal(10,2) NOT NULL,
  `charge_in_percentage` decimal(10,2) NOT NULL,
  `descriptions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'privacy-policy', 1, '2021-08-31 10:42:32', '2021-08-31 10:42:32'),
(2, 'terms-condition', 1, '2021-08-31 10:44:42', '2021-08-31 10:44:42');

-- --------------------------------------------------------

--
-- Table structure for table `page_translations`
--

CREATE TABLE `page_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_translations`
--

INSERT INTO `page_translations` (`id`, `page_id`, `locale`, `title`, `body`, `created_at`, `updated_at`) VALUES
(1, 1, 'English', 'Privacy Policy', '<h3>Information We Collect</h3>\n<p>Information we collect includes both information you knowingly and actively provide us when using or participating in any of our services and promotions, and any information automatically sent by your devices in the course of accessing our products and services.</p>\n<h4>Log Data</h4>\n<p>When you visit our website, our servers may automatically log the standard data provided by your web browser. It may include your device’s Internet Protocol (IP) address, your browser type and version, the pages you visit, the time and date of your visit, the time spent on each page, other details about your visit, and technical details that occur in conjunction with any errors you may encounter.</p>\n<p>Please be aware that while this information may not be personally identifying by itself, it may be possible to combine it with other data to personally identify individual persons.</p>\n<h4>Personal Information</h4>\n<p>We may ask for personal information which may include one or more of the following:</p>\n<ul>\n<li>Name</li>\n<li>Email</li>\n<li>Date of birth</li>\n<li>Phone/mobile number</li>\n</ul>\n<h4>Legitimate Reasons for Processing Your Personal Information</h4>\n<p>We only collect and use your personal information when we have a legitimate reason for doing so. In which instance, we only collect personal information that is reasonably necessary to provide our services to you.</p>\n<h4>Collection and Use of Information</h4>\n<p>We may collect personal information from you when you do any of the following on our website:</p>\n<ul>\n<li>Sign up to receive updates from us via email or social media channels</li>\n<li>Use a mobile device or web browser to access our content</li>\n<li>Contact us via email, social media, or on any similar technologies</li>\n<li>When you mention us on social media</li>\n</ul>\n<p>We may collect, hold, use, and disclose information for the following purposes, and personal information will not be further processed in a manner that is incompatible with these purposes:</p>\n<p>We may collect, hold, use, and disclose information for the following purposes, and personal information will not be further processed in a manner that is incompatible with these purposes:</p>\n<ul>\n<li>to contact and communicate with you</li>\n<li>to enable you to access and use our website, associated applications, and associated social media platforms</li>\n<li>for internal record keeping and administrative purposes</li>\n<li>for security and fraud prevention, and to ensure that our sites and apps are safe, secure, and used in line with our terms of use</li>\n</ul>\n<p>Please be aware that we may combine information we collect about you with general information or research data we receive from other trusted sources.</p>\n<h4>Security of Your Personal Information</h4>\n<p>When we collect and process personal information, and while we retain this information, we will protect it within commercially acceptable means to prevent loss and theft, as well as unauthorized access, disclosure, copying, use, or modification.</p>\n<p>Although we will do our best to protect the personal information you provide to us, we advise that no method of electronic transmission or storage is 100% secure, and no one can guarantee absolute data security. We will comply with laws applicable to us in respect of any data breach.</p>\n<p>You are responsible for selecting any password and its overall security strength, ensuring the security of your own information within the bounds of our services.</p>\n<h4>How Long We Keep Your Personal Information</h4>\n<p>We keep your personal information only for as long as we need to. This time period may depend on what we are using your information for, in accordance with this privacy policy. If your personal information is no longer required, we will delete it or make it anonymous by removing all details that identify you.</p>\n<p>However, if necessary, we may retain your personal information for our compliance with a legal, accounting, or reporting obligation or for archiving purposes in the public interest, scientific, or historical research purposes or statistical purposes.</p>\n<h3>Children’s Privacy</h3>\n<p>We do not aim any of our products or services directly at children under the age of 13, and we do not knowingly collect personal information about children under 13.</p>\n<h3>Disclosure of Personal Information to Third Parties</h3>\n<p>We may disclose personal information to:</p>\n<ul>\n<li>a parent, subsidiary, or affiliate of our company</li>\n<li>third party service providers for the purpose of enabling them to provide their services, for example, IT service providers, data storage, hosting and server providers, advertisers, or analytics platforms</li>\n<li>our employees, contractors, and/or related entities</li>\n<li>our existing or potential agents or business partners</li>\n<li>sponsors or promoters of any competition, sweepstakes, or promotion we run</li>\n<li>courts, tribunals, regulatory authorities, and law enforcement officers, as required by law, in connection with any actual or prospective legal proceedings, or in order to establish, exercise, or defend our legal rights</li>\n<li>third parties, including agents or sub-contractors, who assist us in providing information, products, services, or direct marketing to you third parties to collect and process data</li>\n</ul>\n<h3>International Transfers of Personal Information</h3>\n<p>The personal information we collect is stored and/or processed where we or our partners, affiliates, and third-party providers maintain facilities. Please be aware that the locations to which we store, process, or transfer your personal information may not have the same data protection laws as the country in which you initially provided the information. If we transfer your personal information to third parties in other countries: (i) we will perform those transfers in accordance with the requirements of applicable law; and (ii) we will protect the transferred personal information in accordance with this privacy policy.</p>\n<h3>Your Rights and Controlling Your Personal Information</h3>\n<p>You always retain the right to withhold personal information from us, with the understanding that your experience of our website may be affected. We will not discriminate against you for exercising any of your rights over your personal information. If you do provide us with personal information you understand that we will collect, hold, use and disclose it in accordance with this privacy policy. You retain the right to request details of any personal information we hold about you.</p>\n<p>If we receive personal information about you from a third party, we will protect it as set out in this privacy policy. If you are a third party providing personal information about somebody else, you represent and warrant that you have such person’s consent to provide the personal information to us.</p>\n<p>If you have previously agreed to us using your personal information for direct marketing purposes, you may change your mind at any time. We will provide you with the ability to unsubscribe from our email-database or opt out of communications. Please be aware we may need to request specific information from you to help us confirm your identity.</p>\n<p>If you believe that any information we hold about you is inaccurate, out of date, incomplete, irrelevant, or misleading, please contact us using the details provided in this privacy policy. We will take reasonable steps to correct any information found to be inaccurate, incomplete, misleading, or out of date.</p>\n<p>If you believe that we have breached a relevant data protection law and wish to make a complaint, please contact us using the details below and provide us with full details of the alleged breach. We will promptly investigate your complaint and respond to you, in writing, setting out the outcome of our investigation and the steps we will take to deal with your complaint. You also have the right to contact a regulatory body or data protection authority in relation to your complaint.</p>\n<h3>Use of Cookies</h3>\n<p>We use “cookies” to collect information about you and your activity across our site. A cookie is a small piece of data that our website stores on your computer, and accesses each time you visit, so we can understand how you use our site. This helps us serve you content based on preferences you have specified.</p>\n<h3>Limits of Our Policy</h3>\n<p>Our website may link to external sites that are not operated by us. Please be aware that we have no control over the content and policies of those sites, and cannot accept responsibility or liability for their respective privacy practices.</p>\n<h3>Changes to This Policy</h3>\n<p>At our discretion, we may change our privacy policy to reflect updates to our business processes, current acceptable practices, or legislative or regulatory changes. If we decide to change this privacy policy, we will post the changes here at the same link by which you are accessing this privacy policy.</p>\n<p>If required by law, we will get your permission or give you the opportunity to opt in to or opt out of, as applicable, any new uses of your personal information.</p>', '2021-08-31 10:42:32', '2021-09-05 14:27:37'),
(2, 2, 'English', 'Terms & Condition', '<h2><strong>Terms and Conditions</strong></h2>\r\n<p>Welcome to LivoBank!</p>\r\n<p>These terms and conditions outline the rules and regulations for the use of Livo Bank\'s Website, located at https://livo-bank.trickycode.xyz.</p>\r\n<p>By accessing this website we assume you accept these terms and conditions. Do not continue to use LivoBank if you do not agree to take all of the terms and conditions stated on this page.</p>\r\n<p>The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: \"Client\", \"You\" and \"Your\" refers to you, the person log on this website and compliant to the Company’s terms and conditions. \"The Company\", \"Ourselves\", \"We\", \"Our\" and \"Us\", refers to our Company. \"Party\", \"Parties\", or \"Us\", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client’s needs in respect of provision of the Company’s stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.</p>\r\n<h3><strong>Cookies</strong></h3>\r\n<p>We employ the use of cookies. By accessing LivoBank, you agreed to use cookies in agreement with the Livo Bank\'s Privacy Policy.</p>\r\n<p>Most interactive websites use cookies to let us retrieve the user’s details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.</p>\r\n<h3><strong>License</strong></h3>\r\n<p>Unless otherwise stated, Livo Bank and/or its licensors own the intellectual property rights for all material on LivoBank. All intellectual property rights are reserved. You may access this from LivoBank for your own personal use subjected to restrictions set in these terms and conditions.</p>\r\n<p>You must not:</p>\r\n<ul>\r\n<li>Republish material from LivoBank</li>\r\n<li>Sell, rent or sub-license material from LivoBank</li>\r\n<li>Reproduce, duplicate or copy material from LivoBank</li>\r\n<li>Redistribute content from LivoBank</li>\r\n</ul>\r\n<p>This Agreement shall begin on the date hereof. Our Terms and Conditions were created with the help of the <a href=\"https://www.termsandconditionsgenerator.com\">Terms And Conditions Generator</a>.</p>\r\n<p>Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. Livo Bank does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of Livo Bank,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, Livo Bank shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.</p>\r\n<p>Livo Bank reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.</p>\r\n<p>You warrant and represent that:</p>\r\n<ul>\r\n<li>You are entitled to post the Comments on our website and have all necessary licenses and consents to do so;</li>\r\n<li>The Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party;</li>\r\n<li>The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy</li>\r\n<li>The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.</li>\r\n</ul>\r\n<p>You hereby grant Livo Bank a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.</p>\r\n<h3><strong>Hyperlinking to our Content</strong></h3>\r\n<p>The following organizations may link to our Website without prior written approval:</p>\r\n<ul>\r\n<li>Government agencies;</li>\r\n<li>Search engines;</li>\r\n<li>News organizations;</li>\r\n<li>Online directory distributors may link to our Website in the same manner as they hyperlink to the Websites of other listed businesses; and</li>\r\n<li>System wide Accredited Businesses except soliciting non-profit organizations, charity shopping malls, and charity fundraising groups which may not hyperlink to our Web site.</li>\r\n</ul>\r\n<p>These organizations may link to our home page, to publications or to other Website information so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products and/or services; and (c) fits within the context of the linking party’s site.</p>\r\n<p>We may consider and approve other link requests from the following types of organizations:</p>\r\n<ul>\r\n<li>commonly-known consumer and/or business information sources;</li>\r\n<li>dot.com community sites;</li>\r\n<li>associations or other groups representing charities;</li>\r\n<li>online directory distributors;</li>\r\n<li>internet portals;</li>\r\n<li>accounting, law and consulting firms; and</li>\r\n<li>educational institutions and trade associations.</li>\r\n</ul>\r\n<p>We will approve link requests from these organizations if we decide that: (a) the link would not make us look unfavorably to ourselves or to our accredited businesses; (b) the organization does not have any negative records with us; (c) the benefit to us from the visibility of the hyperlink compensates the absence of Livo Bank; and (d) the link is in the context of general resource information.</p>\r\n<p>These organizations may link to our home page so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products or services; and (c) fits within the context of the linking party’s site.</p>\r\n<p>If you are one of the organizations listed in paragraph 2 above and are interested in linking to our website, you must inform us by sending an e-mail to Livo Bank. Please include your name, your organization name, contact information as well as the URL of your site, a list of any URLs from which you intend to link to our Website, and a list of the URLs on our site to which you would like to link. Wait 2-3 weeks for a response.</p>\r\n<p>Approved organizations may hyperlink to our Website as follows:</p>\r\n<ul>\r\n<li>By use of our corporate name; or</li>\r\n<li>By use of the uniform resource locator being linked to; or</li>\r\n<li>By use of any other description of our Website being linked to that makes sense within the context and format of content on the linking party’s site.</li>\r\n</ul>\r\n<p>No use of Livo Bank\'s logo or other artwork will be allowed for linking absent a trademark license agreement.</p>\r\n<h3><strong>iFrames</strong></h3>\r\n<p>Without prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our Website.</p>\r\n<h3><strong>Content Liability</strong></h3>\r\n<p>We shall not be hold responsible for any content that appears on your Website. You agree to protect and defend us against all claims that is rising on your Website. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.</p>\r\n<h3><strong>Your Privacy</strong></h3>\r\n<p>Please read Privacy Policy</p>\r\n<h3><strong>Reservation of Rights</strong></h3>\r\n<p>We reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amen these terms and conditions and it’s linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.</p>\r\n<h3><strong>Removal of links from our website</strong></h3>\r\n<p>If you find any link on our Website that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.</p>\r\n<p>We do not ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we promise to ensure that the website remains available or that the material on the website is kept up to date.</p>\r\n<h3><strong>Disclaimer</strong></h3>\r\n<p>To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:</p>\r\n<ul>\r\n<li>limit or exclude our or your liability for death or personal injury;</li>\r\n<li>limit or exclude our or your liability for fraud or fraudulent misrepresentation;</li>\r\n<li>limit any of our or your liabilities in any way that is not permitted under applicable law; or</li>\r\n<li>exclude any of our or your liabilities that may not be excluded under applicable law.</li>\r\n</ul>\r\n<p>The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.</p>\r\n<p>As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.</p>', '2021-08-31 10:44:42', '2021-09-05 14:34:10');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supported_currencies` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_rate` decimal(10,6) DEFAULT NULL,
  `fixed_charge` decimal(10,2) NOT NULL DEFAULT 0.00,
  `charge_in_percentage` decimal(10,2) NOT NULL DEFAULT 0.00,
  `minimum_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `maximum_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `slug`, `image`, `status`, `parameters`, `currency`, `supported_currencies`, `extra`, `exchange_rate`, `fixed_charge`, `charge_in_percentage`, `minimum_amount`, `maximum_amount`, `created_at`, `updated_at`) VALUES
(1, 'PayPal', 'PayPal', 'paypal.png', 0, '{\"client_id\":\"\",\"client_secret\":\"\",\"environment\":\"sandbox\"}', NULL, '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"USD\"}', NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL),
(2, 'Stripe', 'Stripe', 'stripe.png', 0, '{\"secret_key\":\"\",\"publishable_key\":\"\"}', NULL, '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL),
(3, 'Razorpay', 'Razorpay', 'razorpay.png', 0, '{\"razorpay_key_id\":\"\",\"razorpay_key_secret\":\"\"}', NULL, '{\"INR\":\"INR\"}', NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL),
(4, 'Paystack', 'Paystack', 'paystack.png', 0, '{\"paystack_public_key\":\"\",\"paystack_secret_key\":\"\"}', NULL, '{\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}', NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL),
(5, 'BlockChain', 'BlockChain', 'blockchain.png', 0, '{\"blockchain_api_key\":\"\",\"blockchain_xpub\":\"\"}', NULL, '{\"BTC\":\"BTC\"}', NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL),
(6, 'Flutterwave', 'Flutterwave', 'flutterwave.png', 0, '{\"public_key\":\"\",\"secret_key\":\"\",\"encryption_key\":\"\",\"environment\":\"sandbox\"}', NULL, '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_requests`
--

CREATE TABLE `payment_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_id` bigint(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_id` bigint(20) NOT NULL,
  `receiver_id` bigint(20) NOT NULL,
  `transaction_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `icon`, `created_at`, `updated_at`) VALUES
(2, '<i class=\"icofont-paper-plane\"></i>', '2021-08-31 07:34:38', '2021-09-05 15:33:22'),
(3, '<i class=\"icofont-money\"></i>', '2021-08-31 07:35:33', '2021-09-05 11:29:47'),
(4, '<i class=\"icofont-exchange\"></i>', '2021-08-31 07:38:26', '2021-09-05 11:30:04'),
(5, '<i class=\"icofont-bank-alt\"></i>', '2021-08-31 07:38:44', '2021-09-05 11:30:19'),
(6, '<i class=\"icofont-file-text\"></i>', '2021-08-31 07:39:01', '2021-09-05 11:30:32'),
(7, '<i class=\"icofont-pay\"></i>', '2021-08-31 07:39:19', '2021-09-05 11:30:43');

-- --------------------------------------------------------

--
-- Table structure for table `service_translations`
--

CREATE TABLE `service_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_translations`
--

INSERT INTO `service_translations` (`id`, `service_id`, `locale`, `title`, `body`, `created_at`, `updated_at`) VALUES
(1, 2, 'English', 'Money Transfer', 'We offers you secure and easy transfer. Transfer money between users within a minutes.', '2021-08-31 07:34:38', '2021-08-31 07:34:38'),
(2, 3, 'English', 'Multi Currency', 'We supports multi currency. Bank conveniently with currencies of your choice.', '2021-08-31 07:35:33', '2021-09-05 11:34:07'),
(3, 4, 'English', 'Exchange Currency', 'We offer lowest exchange fee so you can exchange your currency anytime.', '2021-08-31 07:38:26', '2021-08-31 07:38:26'),
(4, 5, 'English', 'Fixed Deposit', 'We offers long term investment and you will get good interest rate after maturity.', '2021-08-31 07:38:44', '2021-08-31 07:38:44'),
(5, 6, 'English', 'Apply Loan', 'We offers different types loan with low interest rate. You can get a loan easily.', '2021-08-31 07:39:01', '2021-08-31 07:39:01'),
(6, 7, 'English', 'Payment Request', 'You can make payment request to you customer for any types of product or services.', '2021-08-31 07:39:19', '2021-08-31 07:50:50');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'mail_type', 'smtp', NULL, NULL),
(2, 'backend_direction', 'ltr', NULL, '2022-08-07 21:12:08'),
(3, 'language', 'English', NULL, '2022-08-07 21:12:29'),
(4, 'email_verification', 'disabled', NULL, '2022-08-07 21:12:08'),
(5, 'allow_singup', 'yes', NULL, '2022-08-07 21:12:08'),
(6, 'company_name', 'wdwqdwdq', '2022-07-31 18:19:27', '2022-08-07 21:12:29'),
(7, 'site_title', 'wdqwdqw', '2022-07-31 18:19:27', '2022-08-07 21:12:29'),
(8, 'phone', '4234242342', '2022-07-31 18:19:27', '2022-08-07 21:12:29'),
(9, 'email', 'joelleeali977@gmail.com', '2022-07-31 18:19:27', '2022-08-07 21:12:29'),
(10, 'timezone', 'Africa/Asmara', '2022-07-31 18:19:27', '2022-08-07 21:12:29'),
(38, 'main_heading', 'Smart way to keep your money safe and secure', '2021-08-31 15:38:10', '2021-09-05 11:47:17'),
(39, 'sub_heading', 'Transfer money within minutes and save money for your future. All of your desired service in single platform.', '2021-08-31 15:39:15', '2021-09-05 11:47:17'),
(41, 'copyright', 'Copyright © 2021 <a href=\"#\" target=\"_blank\">Tricky Code</a>  -  All Rights Reserved.', '2021-08-31 15:39:15', '2021-09-05 11:24:45'),
(46, 'meta_keywords', '', '2021-08-31 15:39:15', '2021-08-31 15:39:15'),
(47, 'meta_content', '', '2021-08-31 15:39:15', '2021-08-31 15:39:15'),
(49, 'footer_about_us', 'Livo Bank is a micro banking system. We offers different types of financial services to our customers all over the world such as Loan, Wire transfer, Long term deposit, savings and some other related services.', '2021-08-31 15:58:14', '2021-09-05 11:24:45'),
(51, 'primary_menu', '1', '2021-08-31 17:30:14', '2021-08-31 17:30:14'),
(52, 'footer_menu_1', '2', '2021-08-31 17:30:14', '2021-08-31 18:13:31'),
(53, 'footer_menu_1_title', 'Quick Explore', '2021-09-01 06:50:56', '2021-09-01 06:50:56'),
(54, 'footer_menu_2_title', 'Pages', '2021-09-01 06:50:56', '2021-09-05 11:24:45'),
(55, 'footer_menu_2', '3', '2021-09-01 06:50:56', '2021-09-01 06:50:56'),
(56, 'home_about_us_heading', 'About Us', '2021-09-05 10:52:18', '2021-09-05 10:54:38'),
(58, 'home_service_content', 'You can choose any of our services', '2021-09-05 10:52:18', '2021-09-05 11:12:10'),
(59, 'home_fixed_deposit_heading', 'Fixed Deposit Plans', '2021-09-05 10:52:18', '2021-09-05 11:19:41'),
(60, 'home_fixed_deposit_content', 'You will get maximum rewards with us by making long term deposit', '2021-09-05 10:52:18', '2021-09-05 11:19:41'),
(61, 'home_loan_heading', 'Loan Packages', '2021-09-05 10:52:18', '2021-09-05 11:19:41'),
(62, 'home_loan_content', 'We offers different types loan with low interest rate. You will get hassle free loan easily.', '2021-09-05 10:52:18', '2021-09-05 11:19:41'),
(63, 'home_testimonial_heading', 'We served over 500+ Customers', '2021-09-05 10:52:18', '2021-09-05 11:19:41'),
(64, 'home_testimonial_content', '', '2021-09-05 10:52:18', '2021-09-05 11:19:41'),
(65, 'home_partner_heading', 'Partners who support us', '2021-09-05 10:52:18', '2021-09-05 11:19:41'),
(66, 'home_partner_content', '', '2021-09-05 10:52:18', '2021-09-05 11:19:41'),
(67, 'home_about_us_content', 'Livo Bank is a micro banking system. We offers different types of financial services to our customers all over the world. We have multiple branches to provide different services such as Loan, Wire transfer, Long term deposit, savings and some other related services.', '2021-09-05 10:54:15', '2021-09-05 10:54:15'),
(68, 'home_service_heading', 'Our Services', '2021-09-05 10:54:38', '2021-09-05 11:12:10'),
(69, 'total_customer', '500', '2021-09-05 11:06:39', '2021-09-05 11:08:10'),
(70, 'total_branch', '5', '2021-09-05 11:06:39', '2021-09-05 11:11:53'),
(71, 'total_transactions', '1', '2021-09-05 11:06:39', '2021-09-05 11:11:53'),
(72, 'total_countries', '200', '2021-09-05 11:06:39', '2021-09-05 11:11:53'),
(73, 'about_page_title', ' Who We Are', '2021-09-05 15:07:18', '2021-09-05 15:07:18'),
(74, 'our_team_title', 'Meet Our Team', '2021-09-05 15:07:18', '2021-09-05 15:07:18'),
(75, 'our_team_sub_title', '', '2021-09-05 15:07:18', '2021-09-05 15:07:18'),
(76, 'about_us_content', '<p>Livo Bank is a micro banking system. We offers different types of financial services to our customers all over the world. </p><p>We have multiple branches to provide different services such as Loan, Wire transfer, Long term deposit, savings and some other related services.</p>', '2021-09-05 15:08:15', '2021-09-05 15:08:15'),
(77, 'privacy_policy_page', 'privacy-policy', '2022-06-01 15:07:18', '2022-06-01 15:07:18'),
(78, 'terms_condition_page', 'terms-condition', '2022-06-01 15:07:18', '2022-06-01 15:07:18'),
(79, 'APP_VERSION', '1.3.3', '2022-07-31 21:19:27', '2022-07-31 21:19:27'),
(80, 'next_account_number', '2022100291', '2022-08-01 05:28:54', '2022-08-11 03:21:03'),
(81, 'website_enable', 'yes', '2022-08-07 21:12:08', '2022-08-07 21:12:08'),
(82, 'currency_position', 'left', '2022-08-07 21:12:08', '2022-08-07 21:12:08'),
(83, 'date_format', 'Y-m-d', '2022-08-07 21:12:08', '2022-08-07 21:12:08'),
(84, 'time_format', '24', '2022-08-07 21:12:08', '2022-08-07 21:12:08'),
(85, 'mobile_verification', 'disabled', '2022-08-07 21:12:08', '2022-08-07 21:12:08'),
(86, 'enable_2fa', 'no', '2022-08-07 21:12:08', '2022-08-07 21:12:08'),
(87, 'enable_kyc', 'no', '2022-08-07 21:12:08', '2022-08-07 21:12:08'),
(88, 'address', '', '2022-08-07 21:12:29', '2022-08-07 21:12:29');

-- --------------------------------------------------------

--
-- Table structure for table `setting_translations`
--

CREATE TABLE `setting_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `priority` tinyint(4) NOT NULL DEFAULT 0,
  `created_user_id` bigint(20) NOT NULL,
  `operator_id` bigint(20) DEFAULT NULL,
  `closed_user_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `user_id`, `subject`, `status`, `priority`, `created_user_id`, `operator_id`, `closed_user_id`, `created_at`, `updated_at`) VALUES
(1, 3, 'nt’s ROI by 300%', 0, 0, 3, NULL, NULL, '2022-08-15 21:21:23', '2022-08-15 21:21:23');

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_messages`
--

CREATE TABLE `support_ticket_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_ticket_messages`
--

INSERT INTO `support_ticket_messages` (`id`, `support_ticket_id`, `message`, `sender_id`, `attachment`, `created_at`, `updated_at`) VALUES
(1, 1, '•	Introduced Six Sigma in the marketing department, which help increase the client’s ROI by 300%', 3, '1660587683bill pay1.jpg', '2022-08-15 21:21:23', '2022-08-15 21:21:23'),
(2, 1, 'okok okkopkokokokokoko', 3, NULL, '2022-08-15 21:21:40', '2022-08-15 21:21:40');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonial_translations`
--

CREATE TABLE `testimonial_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `testimonial_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonial` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `currency_id` bigint(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `dr_cr` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loan_id` bigint(20) DEFAULT NULL,
  `ref_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `other_bank_id` bigint(20) DEFAULT NULL,
  `gateway_id` bigint(20) DEFAULT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `transaction_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `currency_id`, `amount`, `fee`, `dr_cr`, `type`, `method`, `status`, `note`, `loan_id`, `ref_id`, `parent_id`, `other_bank_id`, `gateway_id`, `created_user_id`, `updated_user_id`, `branch_id`, `transaction_details`, `created_at`, `updated_at`) VALUES
(2, 2, 1, 10.00, 0.00, 'dr', 'Fixed_Deposit', 'Online', 0, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, '2022-08-06 07:59:26', '2022-08-06 08:01:27'),
(4, 3, 1, 19000.00, 0.00, 'dr', 'Fixed_Deposit', 'Online', 2, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, '2022-08-11 00:09:09', '2022-08-11 00:09:24'),
(5, 3, 1, 49000.00, 0.00, 'dr', 'Transfer', 'Online', 2, 'here', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, '2022-08-11 00:11:00', '2022-08-11 00:11:00'),
(6, 2, 1, 49000.00, 0.00, 'cr', 'Transfer', 'Online', 2, 'here', NULL, NULL, 5, NULL, NULL, 3, NULL, NULL, NULL, '2022-08-11 00:11:00', '2022-08-11 00:11:00'),
(8, 3, 1, 1500.00, 0.00, 'dr', 'Transfer', 'Online', 2, 'for le', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, '2022-08-11 03:22:19', '2022-08-11 03:22:19'),
(9, 4, 1, 1500.00, 0.00, 'cr', 'Transfer', 'Online', 2, 'for le', NULL, NULL, 8, NULL, NULL, 3, NULL, NULL, NULL, '2022-08-11 03:22:19', '2022-08-11 03:22:19'),
(14, 3, 1, 500.00, 0.00, 'dr', 'Fixed_Deposit', 'Online', 1, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, '2022-08-15 21:48:09', '2022-08-15 21:48:09'),
(15, 3, 1, 980900.00, 0.00, 'cr', 'Loan', 'Manual', 2, 'Loan Approved', 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2022-08-21 19:49:39', '2022-08-21 19:49:39'),
(16, 3, 1, 87151.78, 0.00, 'dr', 'Loan_Repayment', 'Online', 2, 'Loan Repayment', 5, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, '2022-08-21 19:50:41', '2022-08-21 19:50:41'),
(17, 3, 1, 87151.78, 0.00, 'dr', 'Loan_Repayment', 'Online', 2, 'Loan Repayment', 5, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, '2022-08-22 20:59:58', '2022-08-22 20:59:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `profile_picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `sms_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `two_factor_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_expires_at` datetime DEFAULT NULL,
  `otp` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_expires_at` datetime DEFAULT NULL,
  `allow_withdrawal` tinyint(4) NOT NULL DEFAULT 1,
  `document_verified_at` timestamp NULL DEFAULT NULL,
  `document_submitted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `account_number`, `user_type`, `role_id`, `branch_id`, `status`, `profile_picture`, `email_verified_at`, `sms_verified_at`, `password`, `provider`, `provider_id`, `country_code`, `remember_token`, `created_at`, `updated_at`, `two_factor_code`, `two_factor_expires_at`, `otp`, `otp_expires_at`, `allow_withdrawal`, `document_verified_at`, `document_submitted_at`) VALUES
(1, 'Mister admin', 'admin@omussix.com', NULL, NULL, 'admin', NULL, NULL, 1, 'default.png', '2022-07-31 18:19:02', NULL, '$2a$12$ww5Fuugb/8elYV5WcXSAC.5WaYOf/e0HB/wmHIqD79mBsqNliYSsm', NULL, NULL, NULL, 'vkR9xQazMLXKhf2EsJaEdg9UgyOS2Wu4nFhLc05xY5aHOWB8tnxCTtb47qul', '2022-07-31 18:19:02', '2022-08-11 04:57:04', NULL, NULL, NULL, NULL, 1, NULL, NULL),
(2, 'jacob', 'jacobali977@gmail.com', '2065911126', '2022100159', 'customer', NULL, NULL, 1, 'default.png', '2022-08-01 02:28:54', NULL, '$2y$10$IWU6T5gyPbhkhSp6.pRfVuyIaltMKSAmg57c6zqnIGUyfuH2IeYbu', NULL, NULL, '1340', 'aTNXPhcYw8eD707nQyx9gtTsftJvxnfQA67AprgjlzFigtEJjgL0d4YvX8c3', '2022-08-01 02:28:54', '2022-08-07 21:09:50', NULL, NULL, NULL, NULL, 1, NULL, NULL),
(3, 'joellee', 'joelleeali977@gmail.com', '2065911124', '2022100289', 'customer', NULL, NULL, 1, 'default.png', '2022-08-07 21:43:24', NULL, '$2y$10$/YQE1biU8E6zhghcHGjSHuZIdqvAAsl8N2bStX5C5qEKzIOVfhp1u', NULL, NULL, '1', '60tnZHjXfSSh1xp1Yi0bDNouU4FFUf8VqBJ06NK43oJ8vvYjv6MA43IH912m', '2022-08-07 21:43:24', '2022-08-07 21:43:24', NULL, NULL, NULL, NULL, 1, NULL, NULL),
(4, 'name', 'nkemtheo09@yahoo.com', '2055881778', '2022100290', 'customer', NULL, NULL, 1, 'default.png', '2022-08-11 00:21:03', NULL, '$2y$10$KhHuff0VppPnC4KocuBeEemmYv1tMCm5p.x.91OpmSiu5XzvjDENK', NULL, NULL, '1', NULL, '2022-08-11 00:21:03', '2022-08-11 00:21:03', NULL, NULL, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_documents`
--

CREATE TABLE `user_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` bigint(20) NOT NULL,
  `minimum_amount` decimal(10,2) NOT NULL,
  `maximum_amount` decimal(10,2) NOT NULL,
  `fixed_charge` decimal(10,2) NOT NULL,
  `charge_in_percentage` decimal(10,2) NOT NULL,
  `descriptions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `requirements` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `method_id` bigint(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requirements` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `transaction_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `database_backups`
--
ALTER TABLE `database_backups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit_methods`
--
ALTER TABLE `deposit_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit_requests`
--
ALTER TABLE `deposit_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_sms_templates`
--
ALTER TABLE `email_sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_translations`
--
ALTER TABLE `faq_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `faq_translations_faq_id_locale_unique` (`faq_id`,`locale`);

--
-- Indexes for table `fdrs`
--
ALTER TABLE `fdrs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fdr_plans`
--
ALTER TABLE `fdr_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gift_cards`
--
ALTER TABLE `gift_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_collaterals`
--
ALTER TABLE `loan_collaterals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_payments`
--
ALTER TABLE `loan_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_products`
--
ALTER TABLE `loan_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_repayments`
--
ALTER TABLE `loan_repayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navigations`
--
ALTER TABLE `navigations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navigation_items`
--
ALTER TABLE `navigation_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `navigation_items_parent_id_foreign` (`parent_id`),
  ADD KEY `navigation_items_page_id_foreign` (`page_id`),
  ADD KEY `navigation_items_navigation_id_index` (`navigation_id`);

--
-- Indexes for table `navigation_item_translations`
--
ALTER TABLE `navigation_item_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `navigation_item_translations_navigation_item_id_locale_unique` (`navigation_item_id`,`locale`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_translations`
--
ALTER TABLE `news_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `news_translations_news_id_locale_unique` (`news_id`,`locale`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `other_banks`
--
ALTER TABLE `other_banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_translations_page_id_locale_unique` (`page_id`,`locale`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_requests`
--
ALTER TABLE `payment_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_translations`
--
ALTER TABLE `service_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `service_translations_service_id_locale_unique` (`service_id`,`locale`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting_translations`
--
ALTER TABLE `setting_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_translations_setting_id_locale_unique` (`setting_id`,`locale`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_messages`
--
ALTER TABLE `support_ticket_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonial_translations`
--
ALTER TABLE `testimonial_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `testimonial_translations_testimonial_id_locale_unique` (`testimonial_id`,`locale`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_documents`
--
ALTER TABLE `user_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `database_backups`
--
ALTER TABLE `database_backups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposit_methods`
--
ALTER TABLE `deposit_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposit_requests`
--
ALTER TABLE `deposit_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_sms_templates`
--
ALTER TABLE `email_sms_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `faq_translations`
--
ALTER TABLE `faq_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fdrs`
--
ALTER TABLE `fdrs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fdr_plans`
--
ALTER TABLE `fdr_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gift_cards`
--
ALTER TABLE `gift_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `loan_collaterals`
--
ALTER TABLE `loan_collaterals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_payments`
--
ALTER TABLE `loan_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `loan_products`
--
ALTER TABLE `loan_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `loan_repayments`
--
ALTER TABLE `loan_repayments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `navigations`
--
ALTER TABLE `navigations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `navigation_items`
--
ALTER TABLE `navigation_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `navigation_item_translations`
--
ALTER TABLE `navigation_item_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news_translations`
--
ALTER TABLE `news_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `other_banks`
--
ALTER TABLE `other_banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `page_translations`
--
ALTER TABLE `page_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_requests`
--
ALTER TABLE `payment_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `service_translations`
--
ALTER TABLE `service_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `setting_translations`
--
ALTER TABLE `setting_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `support_ticket_messages`
--
ALTER TABLE `support_ticket_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonial_translations`
--
ALTER TABLE `testimonial_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_documents`
--
ALTER TABLE `user_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `faq_translations`
--
ALTER TABLE `faq_translations`
  ADD CONSTRAINT `faq_translations_faq_id_foreign` FOREIGN KEY (`faq_id`) REFERENCES `faqs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `navigation_items`
--
ALTER TABLE `navigation_items`
  ADD CONSTRAINT `navigation_items_navigation_id_foreign` FOREIGN KEY (`navigation_id`) REFERENCES `navigations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `navigation_items_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `navigation_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `navigation_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `navigation_item_translations`
--
ALTER TABLE `navigation_item_translations`
  ADD CONSTRAINT `navigation_item_translations_navigation_item_id_foreign` FOREIGN KEY (`navigation_item_id`) REFERENCES `navigation_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `news_translations`
--
ALTER TABLE `news_translations`
  ADD CONSTRAINT `news_translations_news_id_foreign` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD CONSTRAINT `page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_translations`
--
ALTER TABLE `service_translations`
  ADD CONSTRAINT `service_translations_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `setting_translations`
--
ALTER TABLE `setting_translations`
  ADD CONSTRAINT `setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `testimonial_translations`
--
ALTER TABLE `testimonial_translations`
  ADD CONSTRAINT `testimonial_translations_testimonial_id_foreign` FOREIGN KEY (`testimonial_id`) REFERENCES `testimonials` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
