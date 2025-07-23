<%@ page import="lk.jiat.app.core.model.User" %>
<%@ page import="lk.jiat.app.core.model.Account" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%
    String flashMessage = (String) session.getAttribute("flashMessage");
    if (flashMessage != null) {
%>
<div id="flashMessage"
     style="background-color: #d1e7dd; color: #0f5132; padding: 15px; border-radius: 5px; margin: 10px 20px; font-weight: bold;">
    <%= flashMessage %>
</div>
<%

    session.removeAttribute("flashMessage"); // You can clear here after displaying
%>


<html>
<head>
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin=""/>
    <link
            rel="stylesheet"
            as="style"
            onload="this.rel='stylesheet'"
            href="https://fonts.googleapis.com/css2?display=swap&amp;family=Noto+Sans%3Awght%40400%3B500%3B700%3B900&amp;family=Public+Sans%3Awght%40400%3B500%3B700%3B900"
    />

    <title>Transactions | Nations Bank</title>
    <link rel="icon" type="image/x-icon" href="/logo.jpeg"/>

    <style>
        .hoverable {
            cursor: pointer; /* Show hand cursor */
            transition: background-color 0.3s, color 0.3s; /* Smooth hover effect */
        }

        .hoverable:hover {
            background-color: #f0f0f0; /* Light gray background on hover */
            border-radius: 6px; /* Optional: rounded edges on hover */
        }

        .hoverable:hover p {
            color: #2563eb; /* Change text color on hover (blue) */
        }

        .hoverable:hover svg {
            color: #2563eb; /* Change icon color on hover */
        }

    </style>

    <script>
        // Auto-hide flash message after 5 seconds
        setTimeout(() => {
            const flash = document.getElementById('flashMessage');
            if (flash) {
                flash.style.transition = "opacity 1s ease";
                flash.style.opacity = 0;
                setTimeout(() => flash.remove(), 1000);
            }
        }, 5000);
    </script>

    <%
            session.removeAttribute("flashMessage");
        }
    %>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
</head>

<%
    User user = (User) session.getAttribute("currentUser");
    Account account = (Account) session.getAttribute("userAccount");
    BigDecimal balance = (BigDecimal) session.getAttribute("userBalance");
%>


<body>
<div class="relative flex size-full min-h-screen flex-col bg-white group/design-root overflow-x-hidden"
     style='font-family: "Public Sans", "Noto Sans", sans-serif;'>
    <div class="layout-container flex h-full grow flex-col">
        <div class="gap-1 px-6 flex flex-1 justify-center py-5">
            <div class="layout-content-container flex flex-col w-80">
                <div class="flex h-full min-h-[700px] flex-col justify-between bg-white p-4">
                    <div class="flex flex-col gap-4">
                        <div class="flex gap-3">
                            <div
                                    class="bg-center bg-no-repeat aspect-square bg-cover rounded-full size-10"
                                    style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuC-EciZgKjUx-drfxHSFKH3ILLvX4jQE61FFijLis_LxIyfrmcHaTYVZ9MNio6l9uGlWiQNbo2bqN8q0kugKZAKQ0pWVh0ydZDbzglurWnO-KuKiUUshhUD0ca1-OuQnDuDjv0gqnfveoCgTas5HNFxzwlf7gXcDDC4XHD6099w0KqQKB1Sccp6KWPurmEiaCtPwLs0fs6YUQdjE1OHVVFlzArZkE7VpWZFwNKywmSDgVw-LHvVtsXJENtNPNywKgiFf9FYoXmI5Dk");'
                            ></div>
                            <div>
                                <h1 class="text-[#111418] text-base font-medium leading-normal"><%= user.getFirstName() + " " + user.getLastName()%>
                                </h1>
                                <h2 class="text-[#111418] text-base font-medium leading-normal">Account
                                    No: <%= account.getAccountNumber() %>
                                </h2>
                            </div>
                        </div>
                        <div class="flex flex-col gap-2">
                            <div class="flex items-center gap-3 px-3 py-2 rounded-xl bg-[#f1f2f4]">
                                <div class="text-[#121416]" data-icon="House" data-size="24px" data-weight="fill">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px"
                                         fill="currentColor" viewBox="0 0 256 256">
                                        <path
                                                d="M224,115.55V208a16,16,0,0,1-16,16H168a16,16,0,0,1-16-16V168a8,8,0,0,0-8-8H112a8,8,0,0,0-8,8v40a16,16,0,0,1-16,16H48a16,16,0,0,1-16-16V115.55a16,16,0,0,1,5.17-11.78l80-75.48.11-.11a16,16,0,0,1,21.53,0,1.14,1.14,0,0,0,.11.11l80,75.48A16,16,0,0,1,224,115.55Z"
                                        ></path>
                                    </svg>
                                </div>
                                <p class="text-[#121416] text-sm font-medium leading-normal">Dashboard</p>
                            </div>
                            <div class="flex items-center gap-3 px-3 py-2">
                                <div class="text-[#121416]" data-icon="CreditCard" data-size="24px"
                                     data-weight="regular">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px"
                                         fill="currentColor" viewBox="0 0 256 256">
                                        <path
                                                d="M224,48H32A16,16,0,0,0,16,64V192a16,16,0,0,0,16,16H224a16,16,0,0,0,16-16V64A16,16,0,0,0,224,48Zm0,16V88H32V64Zm0,128H32V104H224v88Zm-16-24a8,8,0,0,1-8,8H168a8,8,0,0,1,0-16h32A8,8,0,0,1,208,168Zm-64,0a8,8,0,0,1-8,8H120a8,8,0,0,1,0-16h16A8,8,0,0,1,144,168Z"
                                        ></path>
                                    </svg>
                                </div>
                                <p class="text-[#121416] text-sm font-medium leading-normal">Accounts</p>
                            </div>
                            <div class="flex items-center gap-3 px-3 py-2">
                                <div class="text-[#121416]" data-icon="ArrowsLeftRight" data-size="24px"
                                     data-weight="regular">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px"
                                         fill="currentColor" viewBox="0 0 256 256">
                                        <path
                                                d="M213.66,181.66l-32,32a8,8,0,0,1-11.32-11.32L188.69,184H48a8,8,0,0,1,0-16H188.69l-18.35-18.34a8,8,0,0,1,11.32-11.32l32,32A8,8,0,0,1,213.66,181.66Zm-139.32-64a8,8,0,0,0,11.32-11.32L67.31,88H208a8,8,0,0,0,0-16H67.31L85.66,53.66A8,8,0,0,0,74.34,42.34l-32,32a8,8,0,0,0,0,11.32Z"
                                        ></path>
                                    </svg>
                                </div>
                                <p class="text-[#121416] text-sm font-medium leading-normal">Transfers</p>
                            </div>
                            <div class="flex items-center gap-3 px-3 py-2">
                                <div class="text-[#121416]" data-icon="File" data-size="24px" data-weight="regular">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px"
                                         fill="currentColor" viewBox="0 0 256 256">
                                        <path
                                                d="M213.66,82.34l-56-56A8,8,0,0,0,152,24H56A16,16,0,0,0,40,40V216a16,16,0,0,0,16,16H200a16,16,0,0,0,16-16V88A8,8,0,0,0,213.66,82.34ZM160,51.31,188.69,80H160ZM200,216H56V40h88V88a8,8,0,0,0,8,8h48V216Z"
                                        ></path>
                                    </svg>
                                </div>
                                <p class="text-[#121416] text-sm font-medium leading-normal">Statements</p>
                            </div>
                            <div class="flex items-center gap-3 px-3 py-2">
                                <div class="text-[#121416]" data-icon="User" data-size="24px" data-weight="regular">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px"
                                         fill="currentColor" viewBox="0 0 256 256">
                                        <path
                                                d="M230.92,212c-15.23-26.33-38.7-45.21-66.09-54.16a72,72,0,1,0-73.66,0C63.78,166.78,40.31,185.66,25.08,212a8,8,0,1,0,13.85,8c18.84-32.56,52.14-52,89.07-52s70.23,19.44,89.07,52a8,8,0,1,0,13.85-8ZM72,96a56,56,0,1,1,56,56A56.06,56.06,0,0,1,72,96Z"
                                        ></path>
                                    </svg>
                                </div>
                                <p class="text-[#121416] text-sm font-medium leading-normal">Profile</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="layout-content-container flex flex-col max-w-[960px] flex-1">
                <div class="flex flex-wrap justify-between gap-3 p-4"><p
                        class="text-[#121416] tracking-light text-[32px] font-bold leading-tight min-w-72">Dashboard</p>
                </div>

                <h2 class="text-[#121416] text-[22px] font-bold leading-tight tracking-[-0.015em] px-4 pb-3 pt-5">
                    Overview</h2>


                <div class="flex flex-wrap gap-4 p-4">
                    <div class="flex min-w-[158px] flex-1 flex-col gap-2 rounded-xl p-6 bg-[#f1f2f4]">
                        <p class="text-[#121416] text-base font-medium leading-normal">Account Balance</p>
                        <p class="text-[#111418] tracking-light text-2xl font-bold leading-tight">

                            <fmt:formatNumber value="<%= balance%>" type="currency" currencySymbol="Rs." minFractionDigits="2" maxFractionDigits="2" />

                    </div>
                </div>
                <h2 class="text-[#121416] text-[22px] font-bold leading-tight tracking-[-0.015em] px-4 pb-3 pt-5">Quick
                    Actions</h2>
                <div class="flex justify-stretch">
                    <div class="flex flex-1 gap-3 flex-wrap px-4 py-3 justify-start">
                        <button
                                class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-xl h-10 px-4 bg-[#b2cae5] text-[#121416] text-sm font-bold leading-normal tracking-[0.015em]"
                        >
                            <span class="truncate">Transfer Funds</span>
                        </button>

                        <a href="${pageContext.request.contextPath}/user/viewTransactions.jsp">
                            <button
                                    class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-xl h-10 px-4 bg-[#f1f2f4] text-[#121416] text-sm font-bold leading-normal tracking-[0.015em]"
                            >
                                <span class="truncate">View Transactions</span>
                            </button>
                        </a>

                    </div>
                </div>
                <h2 class="text-[#121416] text-[22px] font-bold leading-tight tracking-[-0.015em] px-4 pb-3 pt-5">
                    Transfer Funds</h2>

                <form action="${pageContext.request.contextPath}/transaction" method="post">
                    <div class="flex max-w-[480px] flex-wrap items-end gap-4 px-4 py-3">
                        <label class="flex flex-col min-w-40 flex-1">
                            <p class="text-[#121416] text-base font-medium leading-normal pb-2">Recipient Account
                                Number/ID</p>
                            <input
                                    type="text"
                                    name="recipient"
                                    placeholder="Recipient Account Number/ID"
                                    class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-xl text-[#121416] focus:outline-0 focus:ring-0 border border-[#dde0e3] bg-white focus:border-[#dde0e3] h-14 placeholder:text-[#6a7581] p-[15px] text-base font-normal leading-normal"
                                    required
                            />
                        </label>
                    </div>

                    <div class="flex max-w-[480px] flex-wrap items-end gap-4 px-4 py-3">
                        <label class="flex flex-col min-w-40 flex-1">
                            <p class="text-[#121416] text-base font-medium leading-normal pb-2">Amount to Transfer</p>
                            <input
                                    type="number"
                                    step="0.01"
                                    name="amount"
                                    placeholder="Amount to Transfer"
                                    class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-xl text-[#121416] focus:outline-0 focus:ring-0 border border-[#dde0e3] bg-white focus:border-[#dde0e3] h-14 placeholder:text-[#6a7581] p-[15px] text-base font-normal leading-normal"
                                    required
                            />
                        </label>
                    </div>

                    <div class="flex max-w-[480px] flex-wrap items-end gap-4 px-4 py-3">
                        <label class="flex flex-col min-w-40 flex-1">
                            <p class="text-[#121416] text-base font-medium leading-normal pb-2">Schedule Transfer (Optional)</p>
                            <input type="datetime-local" name="scheduleTime"
                                   class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-xl text-[#121416] focus:outline-0 focus:ring-0 border border-[#dde0e3] bg-white focus:border-[#dde0e3] h-14 p-[15px] text-base font-normal leading-normal"/>
                        </label>
                    </div>

                    <div class="flex max-w-[480px] flex-wrap items-end gap-4 px-4 py-3">
                        <label class="flex flex-col min-w-40 flex-1">
                            <p class="text-[#121416] text-base font-medium leading-normal pb-2">Description of
                                Transfer</p>
                            <input
                                    type="text"
                                    name="description"
                                    placeholder="Purpose of Transfer"
                                    class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-xl text-[#121416] focus:outline-0 focus:ring-0 border border-[#dde0e3] bg-white focus:border-[#dde0e3] h-14 placeholder:text-[#6a7581] p-[15px] text-base font-normal leading-normal"
                            />
                        </label>
                    </div>

                    <div class="flex px-4 py-3 justify-start">
                        <button
                                type="submit"
                                class="flex min-w-[84px] max-w-[480px] cursor-pointer items-center justify-center overflow-hidden rounded-xl h-10 px-4 bg-[#1978e5] text-white text-sm font-bold leading-normal tracking-[0.015em]"
                        >
                            <span class="truncate">Submit Transfer</span>
                        </button>
                    </div>
                </form>


                <h2 class="text-[#121416] text-[22px] font-bold leading-tight tracking-[-0.015em] px-4 pb-3 pt-5">Recent
                    Activity</h2>
                <div class="flex items-center gap-4 bg-white px-4 min-h-[72px] py-2 justify-between">
                    <div class="flex items-center gap-4">
                        <div
                                class="text-[#121416] flex items-center justify-center rounded-lg bg-[#f1f2f4] shrink-0 size-12"
                                data-icon="CurrencyDollar"
                                data-size="24px"
                                data-weight="regular"
                        >
                            <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" fill="currentColor"
                                 viewBox="0 0 256 256">
                                <path
                                        d="M152,120H136V56h8a32,32,0,0,1,32,32,8,8,0,0,0,16,0,48.05,48.05,0,0,0-48-48h-8V24a8,8,0,0,0-16,0V40h-8a48,48,0,0,0,0,96h8v64H104a32,32,0,0,1-32-32,8,8,0,0,0-16,0,48.05,48.05,0,0,0,48,48h16v16a8,8,0,0,0,16,0V216h16a48,48,0,0,0,0-96Zm-40,0a32,32,0,0,1,0-64h8v64Zm40,80H136V136h16a32,32,0,0,1,0,64Z"
                                ></path>
                            </svg>
                        </div>
                        <div class="flex flex-col justify-center">
                            <p class="text-[#121416] text-base font-medium leading-normal line-clamp-1">Interest
                                Added</p>
                            <p class="text-[#6a7581] text-sm font-normal leading-normal line-clamp-2">Interest added to
                                your account</p>
                        </div>
                    </div>
                    <div class="shrink-0"><p class="text-[#121416] text-base font-normal leading-normal">+$12.50</p>
                    </div>
                </div>
                <div class="flex items-center gap-4 bg-white px-4 min-h-[72px] py-2 justify-between">
                    <div class="flex items-center gap-4">
                        <div class="text-[#121416] flex items-center justify-center rounded-lg bg-[#f1f2f4] shrink-0 size-12"
                             data-icon="Download" data-size="24px" data-weight="regular">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" fill="currentColor"
                                 viewBox="0 0 256 256">
                                <path
                                        d="M240,136v64a16,16,0,0,1-16,16H32a16,16,0,0,1-16-16V136a16,16,0,0,1,16-16H72a8,8,0,0,1,0,16H32v64H224V136H184a8,8,0,0,1,0-16h40A16,16,0,0,1,240,136Zm-117.66-2.34a8,8,0,0,0,11.32,0l48-48a8,8,0,0,0-11.32-11.32L136,108.69V24a8,8,0,0,0-16,0v84.69L85.66,74.34A8,8,0,0,0,74.34,85.66ZM200,168a12,12,0,1,0-12,12A12,12,0,0,0,200,168Z"
                                ></path>
                            </svg>
                        </div>
                        <div class="flex flex-col justify-center">
                            <p class="text-[#121416] text-base font-medium leading-normal line-clamp-1">Download
                                Statements</p>
                            <p class="text-[#6a7581] text-sm font-normal leading-normal line-clamp-2">Download your
                                monthly statements</p>
                        </div>
                    </div>
                    <div class="shrink-0">
                        <div class="text-[#121416] flex size-7 items-center justify-center" data-icon="CaretRight"
                             data-size="24px" data-weight="regular">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" fill="currentColor"
                                 viewBox="0 0 256 256">
                                <path d="M181.66,133.66l-80,80a8,8,0,0,1-11.32-11.32L164.69,128,90.34,53.66a8,8,0,0,1,11.32-11.32l80,80A8,8,0,0,1,181.66,133.66Z"></path>
                            </svg>
                        </div>
                    </div>
                </div>
                <div class="flex items-center gap-4 bg-white px-4 min-h-[72px] py-2 justify-between">
                    <div class="flex items-center gap-4">
                        <div class="text-[#121416] flex items-center justify-center rounded-lg bg-[#f1f2f4] shrink-0 size-12"
                             data-icon="User" data-size="24px" data-weight="regular">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" fill="currentColor"
                                 viewBox="0 0 256 256">
                                <path
                                        d="M230.92,212c-15.23-26.33-38.7-45.21-66.09-54.16a72,72,0,1,0-73.66,0C63.78,166.78,40.31,185.66,25.08,212a8,8,0,1,0,13.85,8c18.84-32.56,52.14-52,89.07-52s70.23,19.44,89.07,52a8,8,0,1,0,13.85-8ZM72,96a56,56,0,1,1,56,56A56.06,56.06,0,0,1,72,96Z"
                                ></path>
                            </svg>
                        </div>
                        <div class="flex flex-col justify-center">
                            <p class="text-[#121416] text-base font-medium leading-normal line-clamp-1">Update
                                Profile</p>
                            <p class="text-[#6a7581] text-sm font-normal leading-normal line-clamp-2">Update your
                                personal information</p>
                        </div>
                    </div>
                    <div class="shrink-0">
                        <div class="text-[#121416] flex size-7 items-center justify-center" data-icon="CaretRight"
                             data-size="24px" data-weight="regular">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" fill="currentColor"
                                 viewBox="0 0 256 256">
                                <path d="M181.66,133.66l-80,80a8,8,0,0,1-11.32-11.32L164.69,128,90.34,53.66a8,8,0,0,1,11.32-11.32l80,80A8,8,0,0,1,181.66,133.66Z"></path>
                            </svg>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
