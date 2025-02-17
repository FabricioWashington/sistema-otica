package com.fabriciodev.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class XDebug {

    private static final Logger logger = LoggerFactory.getLogger(XDebug.class);

    public static void x(Object... vars) {
        StackTraceElement stackTrace = Thread.currentThread().getStackTrace()[2];
        String location = "Arquivo: " + stackTrace.getFileName() + " ---> Linha " + stackTrace.getLineNumber();

        logger.info("\n=====================================\n{}\n", location);
        for (int i = 0; i < vars.length; i++) {
            logger.info("ARG[{}]: {}", i, vars[i]);
        }
        logger.info("=====================================\n");
    }

    public static void xd(Object... vars) {
        x(vars);
        throw new RuntimeException("Execução interrompida pelo XDebug.xd()");
    }

    public static void varDump(Object... vars) {
        StackTraceElement stackTrace = Thread.currentThread().getStackTrace()[2];
        String location = "Arquivo: " + stackTrace.getFileName() + " ---> Linha " + stackTrace.getLineNumber();

        logger.info("\n=====================================\n{}\n", location);
        for (int i = 0; i < vars.length; i++) {
            logger.info("ARG[{}]: Tipo: {}, Valor: {}", i, vars[i] != null ? vars[i].getClass().getName() : "null", vars[i]);
        }
        logger.info("=====================================\n");
    }

    public static void varDumpDie(Object... vars) {
        varDump(vars);
        throw new RuntimeException("Execução interrompida pelo XDebug.varDumpDie()");
    }
}
