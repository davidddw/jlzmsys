package org.cloud.ssm.domain;

import java.util.List;

public class ResponseMessage<T> {

    private int total;
    private List<T> rows;
    public int getTotal() {
        return total;
    }
    public void setTotal(int total) {
        this.total = total;
    }

    public ResponseMessage() {
    }

    public List<T> getRows() {
        return rows;
    }
    public void setRows(List<T> rows) {
        this.rows = rows;
    }
    public ResponseMessage(int total, List<T> rows) {
        super();
        this.total = total;
        this.rows = rows;
    }
    @Override
    public String toString() {
        return "ResponseMessage [total=" + total + ", rows=" + rows + ", getTotal()=" + getTotal() + ", getRows()="
                + getRows() + "]";
    }
}
